//
//  ViewController.swift
//  TestDelete
//
//  Created by Ravil on 14.10.2021.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    // MARK: - Private properties
    
//    private let userName = "Ravil"
//    private let password = "123"
    private let currentUser = User.getUserData()
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for vc in viewControllers {
            if let greetingsVC = vc as? GreetingsViewController {
                greetingsVC.currentUser = currentUser
            } else if let navigationVC = vc as? UINavigationController {
                let aboutVC = navigationVC.topViewController as! AboutViewController
                aboutVC.currentUser = currentUser
            }
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func logInButtonPressed() {
        if userNameTF.text != currentUser.login || passwordTF.text != currentUser.password {
            credentialsFailAlert()
            passwordTF.text = ""
        }
    }
    
    @IBAction func forgotUserNamePressed() {
        let alert = UIAlertController(title: "Oops!", message: "Your user name is Mouse", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))

        present(alert, animated: true)
    }
    
    @IBAction func forgotPasswordPressed() {
        let alert = UIAlertController(title: "Oops!", message: "Your password is 123", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Thanks", style: .default))
        
        present(alert, animated: true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    private func credentialsFailAlert() {
        let alert = UIAlertController(title: "Invalid login or password",
                                      message: "Please enter correct login and password",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true)
    }

}

// MARK: - Extentions

extension MainViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
            performSegue(withIdentifier: "showGreetingsVC", sender: nil)
        }
        return true
    }
    
}




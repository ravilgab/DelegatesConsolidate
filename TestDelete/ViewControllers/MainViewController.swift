//
//  ViewController.swift
//  TestDelete
//
//  Created by Ravil on 14.10.2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let userName = "Ravil"
    private let password = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let greetingsVC = segue.destination as? GreetingsViewController else { return }
        greetingsVC.userName = userName
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTF.text != userName || passwordTF.text != password {
            credentialsFailAlert()
            passwordTF.text = ""
        }
    }
    
    @IBAction func forgotUserNamePressed() {
        let alert = UIAlertController(title: "Oops!", message: "Your user name is Ravil", preferredStyle: .alert)
        
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


//
//  AboutViewController.swift
//  TestDelete
//
//  Created by Ravil on 18.10.2021.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameLabel.text = "Имя: \(currentUser.person.fullName)"
        ageLabel.text = "Возраст: \(currentUser.person.age)"
        informationLabel.text = "Информация: \(currentUser.person.about)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let photoVC = segue.destination as? PhotoViewController else { return }
        photoVC.currentUser = currentUser
    }
    
}

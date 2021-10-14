//
//  GreetingsViewController.swift
//  TestDelete
//
//  Created by Ravil on 14.10.2021.
//

import UIKit

class GreetingsViewController: UIViewController {

    @IBOutlet weak var greetingsLabel: UILabel!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsLabel.text = "Hello \(userName)!"
    }
    
}

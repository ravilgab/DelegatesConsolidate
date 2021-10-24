//
//  PhotoViewController.swift
//  TestDelete
//
//  Created by Ravil on 23.10.2021.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var roundedPhotoLabel: UIImageView! {
        didSet {
            roundedPhotoLabel.layer.cornerRadius = roundedPhotoLabel.frame.height / 2
        }
    }
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundedPhotoLabel.image = UIImage(named: currentUser.person.image)
        roundedPhotoLabel.layer.borderWidth = 2
        roundedPhotoLabel.layer.borderColor = UIColor.systemPink.cgColor
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        roundedPhotoLabel.layer.cornerRadius = roundedPhotoLabel.frame.height / 2
//    }
    
}

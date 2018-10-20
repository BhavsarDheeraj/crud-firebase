//
//  WelcomeViewController.swift
//  crud-firebase
//
//  Created by DHEERAJ BHAVSAR on 20/10/18.
//  Copyright © 2018 Dheeraj Bhavsar. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome \(Auth.auth().currentUser?.displayName ?? "")"
    }

    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = signUpVC
        } catch let signOutError as NSError {
            print("Error \(signOutError)")
        }
    }
}

//
//  LoginViewController.swift
//  crud-firebase
//
//  Created by DHEERAJ BHAVSAR on 21/10/18.
//  Copyright © 2018 Dheeraj Bhavsar. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        if let userInfo = getUserInfo() {
            Auth.auth().signIn(withEmail: userInfo["email"]!, password: userInfo["password"]!) { (authResult, error) in
                if error == nil {
                    let welcomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
                    self.present(welcomeVC, animated: true, completion: nil)
                } else {
                    print("\(String(describing: error))")
                }
            }
        }
    }
    
    func getUserInfo() -> [String:String]?{
        if let email = emailTextField.text, let password = passwordTextField.text {
            if email != "" && password != "" {
                let userInfoDict = ["email": email,
                                    "password": password]
                return userInfoDict
            }
        }
        return nil
    }
}

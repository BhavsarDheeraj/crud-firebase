//
//  ViewController.swift
//  crud-firebase
//
//  Created by DHEERAJ BHAVSAR on 20/10/18.
//  Copyright © 2018 Dheeraj Bhavsar. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        if let userInfo = getUserInfo() {
            Auth.auth().createUser(withEmail: userInfo["email"]!, password: userInfo["password"]!) { (authResult, error) in
                if error == nil {
                    self.setDisplayName(to: userInfo["fullName"]!)
                    let welcomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
                    self.present(welcomeVC, animated: true, completion: nil)
                } else {
                    print("\(String(describing: error))")
                }
            }
        }
    }
    
    func getUserInfo() -> [String:String]?{
        if let fullName = fullNameTextField.text, let email = emailTextField.text, let password = passwordTextField.text {
            if fullName != "" && email != "" && password != "" {
                let userInfoDict = ["fullName": fullName,
                                    "email": email,
                                    "password": password]
                return userInfoDict
            }
        }
        return nil
    }
    
    func setDisplayName(to displayName: String) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = displayName
        changeRequest?.commitChanges(completion: { (error) in
            print("\(String(describing: error))")
        })
    }
    
}


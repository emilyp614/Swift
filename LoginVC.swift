//
//  LoginViewController.swift
//  Feb7Chat
//
//  Created by Emily Petroni on 2/8/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//


import UIKit
import Firebase
import SwiftKeychainWrapper

class LoginVC: UIViewController {
    
 
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var userUid: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let _ = KeychainWrapper.standard.string(forKey: "uid") {
            
            performSegue(withIdentifier: "toMessages", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSignUp" {
            
            if let destination = segue.destination as? SignUpVC {
                
                if self.userUid != nil {
                    
                    destination.userUid = userUid
                }
                
                if self.emailField.text != nil {
                    
                    destination.emailField = emailField.text
                }
                
                if self.passwordField.text != nil {
                    
                    destination.passwordField = passwordField.text
                }
            }
        }
    }

 
    @IBAction func signIn(_ sender: AnyObject) {
    
    
        if let email = emailField.text, let password = passwordField.text {
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                
                if error == nil {
                    
                    self.userUid = user?.user.uid
                    
                    KeychainWrapper.standard.set(self.userUid, forKey: "uid")
                    
                    self.performSegue(withIdentifier: "toMessages", sender: nil)
                    
                } else {
                    
                    self.performSegue(withIdentifier: "toSignUp", sender: nil)
                }
            })
        }
    }
}

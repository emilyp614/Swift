//
//  ViewController.swift
//  chat
//
//  Created by Emily Petroni on 1/20/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper


class LoginVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
   var userUid: String!
       
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view, typically from a nib.
       }
       
       override func viewDidAppear(_ animated: Bool) {
       //*******NEED TO REWRITE THIS FOR IF A USER IS COACH OR A CLIENT!**************
      
         if let _ = KeychainWrapper.standard.string(forKey: "uid") {
            let userUID = KeychainWrapper.standard.string(forKey: "uid")
            
            //print(KeychainWrapper.standard.string(forKey: "uid")!)
            ///----------TEST CODE TO GO TO DIFFERENT VC DEPENDING ON COACH OR CLIENT
            Database.database().reference().child("users/\(String( (userUID)!))/CoachOrClient").observeSingleEvent(of: .value, with: {
                              (snapshot) in

                              switch snapshot.value as? String {
                              case "Coach":
                                  let vc = self.storyboard?.instantiateViewController(withIdentifier: "toCoach")
                                  self.present(vc!, animated: true, completion: nil)
                              case "Client":
                                  let vc = self.storyboard?.instantiateViewController(withIdentifier: "toClient")
                                  self.present(vc!, animated: true, completion: nil)
                              default:
                                  print ("CoachorClient:\(snapshot.value!)")
                                  print("Error: Couldn't find type for user \(String(describing: userUID))")
        //////END COACH OR CLIENT TEST CODE
         //  performSegue(withIdentifier: "toMessages", sender: nil)
                    }
                }
            )
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSignUp" {
            
            if let destination = segue.destination as? SignUp {
                
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
    
    @ IBAction func signin (_ Sender: AnyObject) {
        
        if let email = emailField.text, let password = passwordField.text {
            
            Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
                
                if error == nil {
                    
                    self.userUid = user?.user.uid
                    
                    KeychainWrapper.standard.set (self.userUid, forKey: "uid")
                    
        //test code for sending to different parts of app-----------------
                    Database.database().reference().child("users/\(String( (user?.user.uid)!))/CoachOrClient").observeSingleEvent(of: .value, with: {
                    (snapshot) in

                    switch snapshot.value as? String {
                    case "Coach":
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "toCoach")
                        self.present(vc!, animated: true, completion: nil)
                    case "Client":
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "toClient")
                        self.present(vc!, animated: true, completion: nil)
                    default:
                        print ("CoachorClient:\(snapshot.value!)")
                        print("Error: Couldn't find type for user \(String(describing: user?.user.uid))")
                } }) }
    // end test code to swtich segues ---------------------------------------
                    
              //     self.performSegue(withIdentifier: "toMessages", sender: nil)}
                    
                else {
               self.performSegue(withIdentifier: "toSignUp", sender: nil)
                
        }
        
        })
    }
    
    
}
}

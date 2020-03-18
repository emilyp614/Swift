//
//  ViewController.swift
//  chat
//
//  Created by Emily Petroni on 3/16/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftKeychainWrapper

class CoachMessagesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
  
    @IBAction func logoutCoach(_ sender: AnyObject) {
    
    let firebaseAuth = Auth.auth()
         do {
            try firebaseAuth.signOut()
         } catch let signOutError as NSError {
             print ("Error signing out: %@", signOutError)
         }
      //   DataService().keyChain.delete("uid")
         dismiss(animated: true, completion: nil)
     }


}

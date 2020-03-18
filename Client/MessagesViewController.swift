//
//  MessagesViewController.swift
//  
//
//  Created by Emily Petroni on 2/1/20.
//

import UIKit
import FirebaseAuth
import SwiftKeychainWrapper


class MessagesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutTapped(_ sender: AnyObject) {
        
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

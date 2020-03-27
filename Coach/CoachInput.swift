//
//  CoachInput.swift
//  chat
//
//  Created by Emily Petroni on 1/28/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage



class CoachInput: UIViewController {

   var clientDB: DatabaseReference!

    var custChildAutoID: String = ""
    


    @IBOutlet weak var clientName: UITextField!
    
    @IBOutlet weak var clientEmail: UITextField!
    
    
    @IBOutlet weak var clientAge: UITextField!
    
    @IBOutlet weak var clientHeight: UITextField!
    
    @IBOutlet weak var clientWeight: UITextField!
    
    
    @IBOutlet weak var clientShowDate: UIDatePicker!
    
    @IBOutlet weak var clientNotes: UITextField!
    
    @IBOutlet weak var saveClient: UIButton!
    
    // var clientDB:  DatabaseReference!
    
    
    @IBAction func toCancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func saveClient(_ sender: Any) {
        
        clientDB = Database.database(url: "https://myprepcoach-837c5-f207d.firebaseio.com/").reference()
        
        
        let userData = ["clientName": self.clientName.text! as String,
                        "clientEmail": self.clientEmail.text! as String,
                        "clientWeight": self.clientWeight.text! as String,
                        "clientNotes": self.clientNotes.text! as String,
                        "clientHeight": self.clientHeight.text! as String,
                        "clientAge": self.clientAge.text! as String
            //"clientShowDate": self.clientShowDate as String
            ] as [String : Any]
        
     //need to add in another child for each specific coach!
        let userID = Auth.auth().currentUser?.uid
        let clientEmailID  = self.clientEmail.text! as String
        let cleanEmail = clientEmailID.replacingOccurrences(of: ".", with: ",")
        //let userRef = self.clientDB.child("Clients").child(userID!).childByAutoId()
        let userRef = self.clientDB.child("Clients").child(userID!).child(cleanEmail)
        userRef.setValue(userData)
        
        print ("Client Add Successful")
        var custChildID = userRef.key
        print(custChildID)
           
        self.performSegue(withIdentifier: "toClientList", sender: nil)
        
    }
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "chooseMeals" {
         let info = segue.destination as! ClientDetailViewController
         info.myString = custChildAutoID
         
             
         }
     }
    
 */
}

//https://stackoverflow.com/questions/49134297/send-an-email-verfication-email-to-a-new-firebase-user-in-swift

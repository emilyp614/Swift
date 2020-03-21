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


    @IBOutlet weak var clientName: UITextField!
    
    @IBOutlet weak var clientEmail: UITextField!
    
    @IBOutlet weak var clientAge: UIPickerView!
    
    @IBOutlet weak var clientHeight: UIPickerView!
    
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
        
     
        //need to fix this so it doesnt override every time
    //    let clientEmailID = ["clientEmail": self.clientEmail.text! as String]
        
        let userData = ["clientName": self.clientName.text! as String,
                        "clientEmail": self.clientEmail.text! as String,
                        "clientWeight":  self.clientWeight.text! as String,
                        "clientNotes": self.clientNotes.text! as String
            //, "clientHeight" : self.clientHeight.UILabel! as String,
            //"clientShowDate": self.clientShowDate as String
            ] as [String : Any]
        
        //need to fix so knows to save to specific client
        (self.clientDB.child("Clients").childByAutoId() as AnyObject).setValue(userData)
        
        print ("Client Add Successful")
        
           
        self.performSegue(withIdentifier: "toClientList", sender: nil)
    }
}
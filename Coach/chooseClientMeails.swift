//
//  chooseClientMealsVCViewController.swift
//  chat
//
//  Created by Emily Petroni on 3/25/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class ChooseClientMealsVCViewController: UIViewController {
    
    var clientDB: DatabaseReference!
    
   // var custChildAutoID: String = ""
    
    var cleanEmail: String? = ""
    
    
    @IBOutlet weak var meal1: UITextField!
    
    @IBOutlet weak var snack1: UITextField!
    
    @IBOutlet weak var meal2: UITextField!
    
    @IBOutlet weak var snack2: UITextField!
    
    @IBOutlet weak var meal3: UITextField!
    
    @IBOutlet weak var snack3: UITextField!
    
    @IBOutlet weak var saveMealPlan: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func saveClientMealPlan(_ sender: Any) {
        
       clientDB = Database.database(url: "https://myprepcoach-837c5-f207d.firebaseio.com/").reference()
      
      let clientMeals = ["meal1": self.meal1.text! as String,
                     "snack1": self.snack1.text! as String,
                     "meal2": self.meal2.text! as String,
                     "snack2": self.snack2.text! as String,
                     "meal3": self.meal3.text! as String,
                     "snack3": self.snack3.text! as String
              
                 ] as [String : Any]
         
        
      let userID = Auth.auth().currentUser?.uid
      
        print(userID)
        
        print (cleanEmail)
        
        var clientRef = self.clientDB.child("Clients").child(userID!).child(cleanEmail!).child("Meals")
           
        print(clientRef)
        clientRef.setValue(clientMeals)
              
         self.performSegue(withIdentifier: "backToClientDetail", sender: nil)
        
    }
    
}

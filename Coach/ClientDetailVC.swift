//
//  ClientDetailViewController.swift
//  chat
//
//  Created by Emily Petroni on 3/20/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseCore


class ClientDetailViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var showdateLabel: UILabel!
    
    @IBOutlet weak var mealPlanLabel: UILabel!
    
    var clientEmailList = [String]()
    var custChildAutoID: String = ""
    
    var myIndex = 0
    var clientDB = DatabaseReference()
    
    var myString: String? = ""
    var nameString: String? = ""
    var ageString: String? = ""
    var heightString: String? = ""
    var weightString: String? = ""
    var mealtypeString: String? = ""
    var showdateString: String? = ""
    
    var clientIDString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // print(myIndex)
        emailLabel.text = myString
        ageLabel.text = ageString
        weightLabel.text = weightString
        heightLabel.text = heightString
        nameLabel.text = nameString
     
        lookupClientID()
    }
    
    func lookupClientID() {
        
        clientDB = Database.database(url: "https://myprepcoach-837c5-f207d.firebaseio.com/").reference()
        
       let userID = Auth.auth().currentUser?.uid
        
       
        
        self.clientDB.child("Clients").child(userID!).queryOrdered(byChild: "clientName").queryEqual(toValue: "Denise A").observeSingleEvent(of: .childAdded, with: {snapshot in
            
            if snapshot.value != nil {
                print(snapshot.key)
                self.custChildAutoID = snapshot.key
            }
            else {
                print ("user not found")
                self.custChildAutoID = "nil"
            }
            
            print (self.custChildAutoID)
        })
        
   
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "chooseMeals" {
            let info = segue.destination as! ChooseClientMealsVCViewController
            info.clientIDString = custChildAutoID
            
                
            }
        }
   
}

//https://stackoverflow.com/questions/38040648/finding-an-uid-by-email-in-firebase

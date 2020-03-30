//
//  TableViewController.swift
//  chat
//
//  Created by Emily Petroni on 1/28/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseCore

class MealsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let meal: [String] = ["Workout Day", "Rest Day"]
    let cellReuseIdentifier = "PlainCell2"
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red]
    var ref =  DatabaseReference()
    var clientDB = DatabaseReference()
    var userEmail: String = ""
    var custChildAutoID: String = ""
    var cleanEmail: String = ""
    var clientID: String = ""
    var coachKey: String = ""
    var clientE: String = ""
    var meal1: String = ""

    @IBOutlet var MealsTable: UITableView!
    
   override func viewDidLoad() {
       super.viewDidLoad()
       MealsTable.tableFooterView = UIView()
       MealsTable.rowHeight = 150
       ref = Database.database().reference()
       
    
    lookupCurrentEmail()

   getMgrID()
   
   }
      
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

          
          return self.meal.count
      }
          
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
         let cell: MealsTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MealsTableViewCell
         
         cell.MealsImage.backgroundColor = self.colors[indexPath.row]
         cell.MealsLabel.text = self.meal[indexPath.row]
      
        return cell

      }
     
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print("You tapped cell number \(indexPath.row).")
     }
    
    //add function to get current email address in sign up DB
    func lookupCurrentEmail() {
       
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).child("Email").observeSingleEvent(of: .value, with: { snapshot in
    
             if snapshot.exists() {

                let userEmail = snapshot.value as!  String
      
              //print(userEmail)
                self.userEmail = userEmail
           
                //get meal list
            
                let clientCoachID = Database.database(url: "https://myprepcoach-837c5-f207d.firebaseio.com/").reference().child("Clients")
                //print ("get manager this is email")
                
                print(userEmail)
                
                }
            }
        )
        
    }
        //get client meals data
    
    
    //function to get manager id of client email address
   func getMgrID() {
       let clientCoachID = Database.database(url: "https://myprepcoach-837c5-f207d.firebaseio.com/").reference().child("Clients")
       // print ("get manager this is email")
      //  print(self.userEmail)

     clientCoachID.observe(.value, with:{ (snapshot: DataSnapshot) in
            for snap in snapshot.children.allObjects as! [DataSnapshot]{
                for subSnap in snap.children.allObjects as! [DataSnapshot] {
                    
                    //coachKey = snap.value as? String
                   // clientE = subSnap.value as? String
                    if subSnap.key.replacingOccurrences(of: ",", with: ".") == self.userEmail {
              
                        self.coachKey = (subSnap ).key as String
                        self.clientE = (snap ).key as String
                        print((subSnap ).key)
                        print ((snap ).key)
               
                    } }
                }
            }
        )
    
    }
    
    //function to get meal list for current client
   func getMealsArray() {
        let clientEmailID = clientE
        cleanEmail = clientEmailID.replacingOccurrences(of: ".", with: ",")
        
        clientDB = Database.database(url: "https://myprepcoach-837c5-f207d.firebaseio.com/").reference()
        
    let clientRef = clientDB.child("Clients").child(coachKey).child(cleanEmail)
        
            clientRef.observeSingleEvent(of: .value, with: { (snapshot) in

                      // Iterate through all of your positions
                      for child in snapshot.children.allObjects as! [DataSnapshot] {

                         let client = child
                       
                         let clientID = client.value as! [String: Any]

                         let meal = clientID["Meal 1"] as! String

                         if meal != nil {
                          //  self.clientList.append(clientName)
                            self.meal1 = meal
                            print (self.meal1)
                         }
                    }
                }
        )
    }
}

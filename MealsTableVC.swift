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
    

    @IBOutlet var MealsTable: UITableView!
    
   override func viewDidLoad() {
       super.viewDidLoad()
       MealsTable.tableFooterView = UIView()
       MealsTable.rowHeight = 150
       ref = Database.database().reference()
        lookupCurrentEmail()
   
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

                     print(userEmail)
            }
        })
            
}
    //add function to get clientID in coach DB
    
    //fundtion to get meal list for current client
    

 
}
 

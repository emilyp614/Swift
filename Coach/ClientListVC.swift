//
//  ClientListViewController.swift
//  chat
//
//  Created by Emily Petroni on 3/18/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseCore

class ClientListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var clientList = [String]()
    var clientEmailList = [String]()
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red]
    let cellReuseIdentifier = "clientCell"
    var myIndex = 0

    
    @IBOutlet var ClientTable: UITableView!
    
    
       override func viewDidLoad() {
        super.viewDidLoad()
           ClientTable.tableFooterView = UIView()
           ClientTable.rowHeight = 50
       
        ClientTable.delegate = self
        ClientTable.dataSource = self
        
        retrieveClientNames()
        
        getArrays()
        
    }
       

           
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            print("The list has \(clientList.count).")
           return clientList.count
       }
           

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
           let cell: ClientListTableCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ClientListTableCell
           
            cell.clientLabel.text = self.clientList[indexPath.row]
           //cell.myLabel.textAlignment = NSTextAlignment
        
          return cell

                        }
       
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            myIndex = indexPath.row
            performSegue(withIdentifier: "toClientDetail", sender: self)
            
           print("You tapped cell number \(indexPath.row)."
            )}
    
    
    func retrieveClientNames (){
       
        var ref: DatabaseReference
        ref = Database.database(url: "https://myprepcoach-837c5-f207d.firebaseio.com/").reference()
       
        let userID = Auth.auth().currentUser?.uid
        
        let clientRef = ref.child("Clients").child(userID!)

               clientRef.observeSingleEvent(of: .value, with: { (snapshot) in

                   // Iterate through all of your positions
                   for child in snapshot.children.allObjects as! [DataSnapshot] {

                      let client = child
                    
                      let clientID = client.value as! [String: Any]

                      let clientName = clientID["clientName"] as! String

                      if clientName != nil {
                         self.clientList.append(clientName)
                      }
                   }

                   self.ClientTable.reloadData()
        
        })
    }
    
   func getArrays() {
            
          
            var ref: DatabaseReference
             ref = Database.database(url: "https://myprepcoach-837c5-f207d.firebaseio.com/").reference()
            
             let userID = Auth.auth().currentUser?.uid
             
             let clientRef = ref.child("Clients").child(userID!)

              //get the email list array
                    clientRef.observeSingleEvent(of: .value, with: { (snapshot) in

                        // Iterate through all of your positions
                        for child in snapshot.children.allObjects as! [DataSnapshot] {

                           let client = child
                         
                           let clientID = client.value as! [String: Any]

                           let clientEmail = clientID["clientEmail"] as! String

                           if clientEmail != nil {
                              self.clientEmailList.append(clientEmail)
                            
                            }
                        }
                    })
    }
}

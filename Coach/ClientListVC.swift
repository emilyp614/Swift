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
    var clientAgeList = [String]()
    var clientWeightList = [String]()
    var clientHeightList = [String]()
    var clientMealTypeList = [String]()
    var clientShowDateList = [String]()
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red]
    let cellReuseIdentifier = "clientCell"
    var myIndex = 0
    var textToBeSent: String = ""
    var ageToBeSent: String = ""
    var weightToBeSent: String = ""
    var heightToBeSent: String = ""
    var mealTypeToBeSent: String = ""
    var showdateToBeSent: String = ""
    var nameToBeSent: String = ""

    
    @IBOutlet var ClientTable: UITableView!
    
    
       override func viewDidLoad() {
        super.viewDidLoad()
           ClientTable.tableFooterView = UIView()
           ClientTable.rowHeight = 50
       
        ClientTable.delegate = self
        ClientTable.dataSource = self
        
        retrieveClientNames()
        
        getArrays()
       // print("this is the client email list")
       // print(clientEmailList)
        
    }
       
   func AddClientButtonTapped(_sender: UIBarButtonItem!){
     
    performSegue(withIdentifier: "addClientInfo", sender: self)
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
            textToBeSent = clientEmailList[myIndex]
            ageToBeSent = clientAgeList[myIndex]
            weightToBeSent = clientWeightList[myIndex]
            heightToBeSent = clientHeightList[myIndex]
            nameToBeSent = clientList[myIndex]
            
            performSegue(withIdentifier: "toClientDetail", sender: self)
            
           print("You tapped cell number \(indexPath.row)."
            )}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toClientDetail" {
        let info = segue.destination as! ClientDetailViewController
        info.myString = textToBeSent
        info.ageString = ageToBeSent
        info.weightString = weightToBeSent
        info.heightString = heightToBeSent
        info.nameString = nameToBeSent
            
        }
    }
    
    
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

                           let client1 = child
                         
                           let clientID1 = client1.value as! [String: Any]
 
                           let clientEmail1 = clientID1["clientEmail"] as! String

                          if clientEmail1 != nil {
                              self.clientEmailList.append(clientEmail1)
                           
                           
                           }
                        }
                        //get age data
                        for child in snapshot.children.allObjects as! [DataSnapshot] {

                              let client1 = child
                            
                              let clientID2 = client1.value as! [String: Any]
    
                              let clientAge = clientID2["clientAge"] as! String

                             if clientAge != nil {
                                 self.clientAgeList.append(clientAge)
                                                  
                          
                          }
                       }
                        
                        //get weight data
                            for child in snapshot.children.allObjects as! [DataSnapshot] {

                                  let client1 = child
                                
                                  let clientID3 = client1.value as! [String: Any]
        
                                  let clientWeight = clientID3["clientWeight"] as! String

                                 if clientWeight != nil {
                                     self.clientWeightList.append(clientWeight)
                                                      
                              
                              }
                           }
                        
                    //get height data
                        for child in snapshot.children.allObjects as! [DataSnapshot] {

                              let client1 = child
                            
                              let clientID4 = client1.value as! [String: Any]
    
                              let clientHeight = clientID4["clientHeight"] as! String

                             if clientHeight != nil {
                                 self.clientHeightList.append(clientHeight)
                                                  
                          
                          }
                       }
                         self.ClientTable.reloadData()
                    })
    }
}

//
//  TableViewController.swift
//  chat
//
//  Created by Emily Petroni on 1/28/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//

import UIKit

class MealsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let meal: [String] = ["Workout Day", "Rest Day"]
    let cellReuseIdentifier = "PlainCell2"
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red]

    

    @IBOutlet var MealsTable: UITableView!
    
   override func viewDidLoad() {
       super.viewDidLoad()
       MealsTable.tableFooterView = UIView()
       MealsTable.rowHeight = 150
   
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
}

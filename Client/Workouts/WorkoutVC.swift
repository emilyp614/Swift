//
//  ViewController.swift
//  chat
//
//  Created by Emily Petroni on 1/27/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//

import UIKit


class WOViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
     
    let workout: [String] = ["Day 1", "Day 2", "Day 3", "Day 4"]
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red]
    let cellReuseIdentifier = "PlainCell"
    
    
    @IBOutlet var WOtable: UITableView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        WOtable.tableFooterView = UIView()
        WOtable.rowHeight = 150
    
          //  tableView.delegate = self
            //tableView.dataSource = self
    }
    
        
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        return self.workout.count
    }
        
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell: WOTableViewCell2 = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! WOTableViewCell2
        
        let imageName = UIImage(named: workout[indexPath.row])
        //var image: UIImage =
        cell.myImage.image = imageName
        cell.myLabel.text = self.workout[indexPath.row]
        //cell.myLabel.textAlignment = NSTextAlignment
     
        
        
       return cell

     }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}

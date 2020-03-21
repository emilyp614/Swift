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
    
    var myIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailLabel.text = clientEmailList[myIndex]
        // Do any additional setup after loading the view.
    }
    

}
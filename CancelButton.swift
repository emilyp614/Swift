//
//  CancelButton.swift
//  chat
//
//  Created by Emily Petroni on 3/25/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//

import UIKit

class CancelButton: UIButton {

     override init(frame: CGRect) {
          super.init(frame: frame)
          setUpButton()

      
      }
      
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          setUpButton()
      }
      

      func setUpButton() {
          
          styleButton()
      }
      
      func styleButton(){
          
      
          setTitleColor(.white, for: .normal)
          backgroundColor = UIColor(red: 255, green: 0, blue: 53)
          titleLabel?.font = UIFont(name: "Arial", size: 18)
          layer.cornerRadius = 10
          layer.borderWidth = 0.0
            
    }

}

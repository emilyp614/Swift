//
//  CustomButton.swift
//  chat
//
//  Created by Emily Petroni on 3/24/20.
//  Copyright © 2020 Emily Petroni. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
        
        let black = UIColor(red: 5, green: 5, blue: 5, alpha: 0.0)
        let myGrey = UIColor(red: 18, green: 51, blue: 69, alpha: 0.0)
        let newnavy = UIColor(red: 117, green: 114, blue: 126, alpha: 0.0)
        let myRed = UIColor(red: 255, green: 0, blue: 53, alpha: 0.0)
        let white = UIColor(red: 255, green: 255, blue: 255, alpha: 0.0)
        
    }
}

class SaveButton: UIButton {

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
        backgroundColor = UIColor(red: 110, green: 153, blue: 47)
        titleLabel?.font = UIFont(name: "Arial", size: 18)
        layer.cornerRadius = 10
        layer.borderWidth = 0.0
          
    }

  }



//
//  User.swift
//  TinderBee
//
//  Created by Mondale on 10/15/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import Foundation
import UIKit
 
struct User {
//    Defining our properties for our model layer
    
    let name : String
    let age : Int
    let profession : String
    let imageName : String
    
    
    func toCardViewModel() -> CardViewModel {
        let attributedText = NSMutableAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        
        attributedText.append(NSMutableAttributedString(string:" \(age)",attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .light)]))
        
        attributedText.append(NSMutableAttributedString(string:"\n\(profession)",attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .light)]))
        
        return CardViewModel(imageName: imageName, attributedString: attributedText, textAlignment: .left)
    }
}


//
//  Advertiser.swift
//  TinderBee
//
//  Created by Mondale on 10/16/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import Foundation
import UIKit

struct Advertiser: ProduceCardViewModel {
    let title: String
    let brandName: String
    let posterPhotoName: String
    
    func toCardViewModel() -> CardViewModel {
        let attributedString = NSMutableAttributedString(string: title, attributes: [.font : UIFont.systemFont(ofSize: 34, weight:.heavy)])
        
        attributedString.append(NSAttributedString(string: "\n" + brandName, attributes: [.font: UIFont.systemFont(ofSize: 34, weight: .bold)]))
        
        return CardViewModel(imageName: posterPhotoName, attributedString: attributedString, textAlignment: .center)
    }
}



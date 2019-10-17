//
//  CardViewModel.swift
//  TinderBee
//
//  Created by Mondale on 10/16/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import UIKit

protocol ProduceCardViewModel {
    func toCardViewModel() -> CardViewModel
}

struct CardViewModel {
//We'll define the properties that our view will display/render out
    let imageName: String
    let attributedString: NSAttributedString
    let textAlignment: NSTextAlignment
    

}


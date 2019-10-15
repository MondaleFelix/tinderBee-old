//
//  ViewController.swift
//  TinderBee
//
//  Created by Mondale on 10/14/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

       
        
//      Iterates through the colors and creates an array
        let subviews = [UIColor.gray, UIColor.darkGray, UIColor.black].map
            { (color) -> UIView in
                let v = UIView()
                v.backgroundColor = color
                return v
        }
        
        let topStackView = UIStackView(arrangedSubviews: subviews)
        topStackView.distribution = .fillEqually
        

        topStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
//        Bottom row of buttons
        let buttonStackView = HomeBottomControlsStackView()
        
        
        
        
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, blueView, buttonStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)

        
    }

}


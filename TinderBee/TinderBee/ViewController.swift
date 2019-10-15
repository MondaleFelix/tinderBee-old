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
        
        let redView = UIView()
        redView.backgroundColor = .red
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let stackView = UIStackView(arrangedSubviews: [redView, blueView])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        
        stackView.frame = .init(x: 0, y: 0, width: 300, height: 200)
        
//       
        stackView.fillSuperview()

        
    }

}


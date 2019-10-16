//
//  ViewController.swift
//  TinderBee
//
//  Created by Mondale on 10/14/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    let topStackView = TopNavigationStackView()
    let cardsDeckView = UIView()
    let buttonStackView = HomeBottomControlsStackView()

    let users = [
        User(name: "Kelly", age: 23, profession: "Music DJ", imageName: "lady5c"),
        User(name: "Jane", age: 18, profession: "Teacher", imageName: "lady4c")

    ]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupDummyCards()
        
    }
    
    fileprivate func setupDummyCards(){
        
        
        users.forEach { (user) in
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: user.imageName)
            cardView.informationLabel.text = "\(user.name) \(user.age)\n\(user.profession)"
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }

    }
    
//  MARK :- Fileprivate
    fileprivate func setupLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, buttonStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        
//      A z index is assigned to the UIViews, this will bring cardsDeckView to the front
        overallStackView.bringSubviewToFront(cardsDeckView)
    }

}

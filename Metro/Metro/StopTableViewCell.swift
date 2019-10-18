//
//  StopTableViewCell.swift
//  Metro
//
//  Created by Mondale on 10/17/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import UIKit

class StopTableViewCell: UITableViewCell {
    
    
    
    init() {
        super.init(style: .default, reuseIdentifier: "stopID")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

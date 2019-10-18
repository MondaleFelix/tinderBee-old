//
//  Stop.swift
//  Metro
//
//  Created by Mondale on 10/17/19.
//  Copyright © 2019 Mondale. All rights reserved.
//

import Foundation

struct Stop: Decodable {
    let arrivalMinutes: Int
    let isDeparting: Bool
    
    enum CodingKeys: String, CodingKey {
        case arrivalMinutes = "minutes"
        case isDeparting = "is_departing"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        arrivalMinutes = try container.decode(Int.self, forKey: .arrivalMinutes)
        isDeparting = try container.decode(Bool.self, forKey: .isDeparting)
    }
}

struct RootContainer: Decodable {
    let items: [Stop]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([Stop].self, forKey: .items)
    }
}

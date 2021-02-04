//
//  Outcome.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import Foundation

public struct Outcome: Decodable {
    public let id: String
    public let name: String
    public let price: String
    
    init(id : String , name: String, price: String) {
        self.id = id
        self.name = name
        self.price = price
    }
}

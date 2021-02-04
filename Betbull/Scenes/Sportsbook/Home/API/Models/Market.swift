//
//  Market.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import Foundation

public struct Market: Decodable {
    public let name: String
    public let outcomes: [Outcome]
    
    init(name: String, outcomes: [Outcome]) {
        self.name = name
        self.outcomes = outcomes
    }
}

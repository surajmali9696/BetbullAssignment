//
//  Event.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import Foundation

public struct Event: Decodable {
    public let id: String
    public let name: String
    public let markets: [Market]
    public let startTime: TimeInterval
    
    init(id : String , name: String, markets: [Market], startTime : TimeInterval) {
        self.id = id
        self.name = name
        self.markets = markets
        self.startTime = startTime
    }
}

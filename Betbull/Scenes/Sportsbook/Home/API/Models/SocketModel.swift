//
//  SocketModel.swift
//  Betbull
//
//  Created by AryaOmnitalk MDA on 31/01/21.
//  Copyright © 2021 Betbull. All rights reserved.
//

import Foundation

public struct SocketModel: Decodable {
    public let event: String
    public let startTime: TimeInterval
    
    init(event : String , startTime: TimeInterval) {
        self.event = event
        self.startTime = startTime
    }
}

public struct SocketModelForOutcomes: Decodable {
    public let outcome: String
    public let price: String
    
    init(outcome : String , price: String) {
        self.outcome = outcome
        self.price = price
    }
}

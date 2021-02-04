//
//  Tournament.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import Foundation

public struct Tournament: Decodable {
    public let id: String
    public let events: [Event]
    public let icon: URL
    public let name: String
    
    init(id : String , events: [Event], icon : URL, name: String) {
        self.id = id
        self.events = events
        self.icon = icon
        self.name = name
    }
}

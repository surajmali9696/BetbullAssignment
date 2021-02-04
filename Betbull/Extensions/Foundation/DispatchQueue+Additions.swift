//
//  DispatchQueue+Additions.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import Dispatch

public extension DispatchQueue {
  static let websocket = DispatchQueue(label: "com.betbull.websocket", qos: .utility, attributes: .concurrent)
}

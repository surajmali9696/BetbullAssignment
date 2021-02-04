//
//  URL+Additions.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import Foundation

extension URL: ExpressibleByStringLiteral {

  public init(stringLiteral value: String) {
    self.init(string: value)!
  }
}

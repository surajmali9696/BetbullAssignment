//
//  DateFormatter+Additions.swift
//  Betbull
//
//  Created by Betbull on 16.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import Foundation

public extension DateFormatter {

  convenience init(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) {
    self.init()

    self.dateStyle = dateStyle
    self.timeStyle = timeStyle
  }
}

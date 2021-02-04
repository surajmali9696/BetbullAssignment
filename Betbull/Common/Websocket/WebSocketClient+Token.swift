//
//  WebSocketClient+Token.swift
//  Betbull
//
//  Created by Betbull on 16.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import Foundation

public extension WebSocketClient {

  final class Token: NSObject {
    public let notificationCenter: NotificationCenter
    public let token: Any

    public init(notificationCenter: NotificationCenter, token: Any) {
      self.notificationCenter = notificationCenter
      self.token = token
    }

    deinit {
      notificationCenter.removeObserver(token)
    }
  }
}

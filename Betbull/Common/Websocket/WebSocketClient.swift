//
//  WebSocketClient.swift
//  Betbull
//
//  Created by Betbull on 16.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import Starscream

public final class WebSocketClient: WebSocketDelegate {

  private let client: WebSocket
  private let notifier: NotificationCenter
  private let didReceiveNotification: Notification.Name

  private init(request: URLRequest) {
    notifier = NotificationCenter.default
    didReceiveNotification = .init(rawValue: "WebSocketClientDidReceiveNotification")
    client = WebSocket(request: request)
    client.delegate = self
    client.callbackQueue = .websocket
  }

  public func connect() {
    client.connect()
  }

  public func register(with closure: @escaping (String) -> Void) -> Token {
    let token = notifier.addObserver(forName: didReceiveNotification, object: self, queue: .none) {
      if let text = $0.userInfo?["text"] as? String {
        closure(text)
      }
    }
    return Token(notificationCenter: notifier, token: token)
  }

  public func didReceive(event: WebSocketEvent, client: WebSocket) {
    if case .text(let text) = event {
      notifier.post(name: didReceiveNotification, object: self, userInfo: ["text": text])
    }
  }

  // In testing with real device, make sure you are connected to same Wi-fi access point
  // and use websocket's internal IP address instead such as `http://127.0.1.54:8080/websocket`.
  // For testing with simulator, it is fine to set 0.0.0.0.
  public static let shared = WebSocketClient(request: "http://0.0.0.0:8080/websocket")
}

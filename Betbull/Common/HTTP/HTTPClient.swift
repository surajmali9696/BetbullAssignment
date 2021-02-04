//
//  HTTPClient.swift
//  Betbull
//
//  Created by Betbull on 16.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import Foundation

public struct HTTPClient {

  private let session: URLSession

  public init(session: URLSession) {
    self.session = session
  }

  public static let shared = HTTPClient(session: .shared)

  public func object<T: HTTPRequest, U: Decodable>(request: T, completion: @escaping (Result<U, Error>) -> Void) {
    
  }

  public func objects<T: HTTPRequest, U: Decodable>(request: T, completion: @escaping (Result<[U], Error>) -> Void) {
  }
}

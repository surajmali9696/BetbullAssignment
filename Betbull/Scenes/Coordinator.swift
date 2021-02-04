//
//  Coordinator.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import UIKit

public protocol Coordinator {

  associatedtype Scene: UIViewController

  func scene() -> Scene

  func present(onto presenter: UIViewController)
  func navigate(onto navigator: UINavigationController)
}

public extension Coordinator {

  func navigator() -> UINavigationController {
    return .init(rootViewController: scene())
  }
}

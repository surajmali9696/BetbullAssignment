//
//  EventDetailCoordinator.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import UIKit

public final class SportsbookEventCoordinator: Coordinator {

  public typealias Scene = SportsbookEventScene

  public init(with id: String) {
    // ...
  }

  public func scene() -> SportsbookEventScene {
    return Scene()
  }

  public func present(onto presenter: UIViewController) {
  }

  public func navigate(onto navigator: UINavigationController) {
    // This coordinator does not support navigation.
  }
}

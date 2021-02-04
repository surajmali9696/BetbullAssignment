//
//  SportsbookHomeCoordinator.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import UIKit

public final class SportsbookHomeCoordinator: Coordinator {

  public typealias Scene = SportsbookHomeScene

  private weak var view: Scene?

  public func scene() -> Scene {
    let storyboard = UIStoryboard(name: "Sportsbook", bundle: .main)
    let scene: Scene = storyboard.allocate(with: "Home")

    scene.interactor = SportsbookHomeInteractor()
    scene.interactor.coordinator = self

    return scene
  }

  public func present(onto presenter: UIViewController) {
    // This coordinator does not support presentation.
  }

  public func navigate(onto navigation: UINavigationController) {
    view = scene()
    navigation.setViewControllers([view!], animated: false)
  }

  public func show(eventWith id: String) {
    // SportsbookEventCoordinator(with: ...)...
  }
}

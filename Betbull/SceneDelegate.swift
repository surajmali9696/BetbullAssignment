//
//  SceneDelegate.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import UIKit

public class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  public var window: UIWindow? = .init(frame: UIScreen.main.bounds)

    @available(iOS 13.0, *)
    public func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    let navigation = UINavigationController()

    window?.windowScene = (scene as? UIWindowScene)
    window?.rootViewController = navigation
    window?.makeKeyAndVisible()

    SportsbookHomeCoordinator().navigate(onto: navigation)
  }
}

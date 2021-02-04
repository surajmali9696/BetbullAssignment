//
//  SportsbookEventScene.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import UIKit

public final class SportsbookEventScene: UIViewController {

  public var interactor: SportsbookEventInteractor!

  public override func viewDidLoad() {
    super.viewDidLoad()

    interactor.event()
  }
}

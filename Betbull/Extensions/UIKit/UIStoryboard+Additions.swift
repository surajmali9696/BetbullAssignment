//
//  UIStoryboard+Additions.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import UIKit

public extension UIStoryboard {

  func allocate<T: UIViewController>(with identifier: String) -> T {
    guard let view = instantiateViewController(withIdentifier: identifier) as? T else {
      preconditionFailure("Invalid type of view controller. Expected: \(T.self)")
    }
    return view
  }
}

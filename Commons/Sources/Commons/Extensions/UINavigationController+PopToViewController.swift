//
//  UINavigationController+PopToViewController.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import UIKit

public extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}

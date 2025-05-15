//
//  UIView+ViewController.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import UIKit

extension UIView {

    var viewController: UIViewController? {

        var responder: UIResponder? = self

        while responder != nil {
            if let responder = responder as? UIViewController {
                return responder
            }
            responder = responder?.next
        }
        return nil
    }
}

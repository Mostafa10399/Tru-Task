//
//  ViewControllerContainment.swift
//  DessertDelights
//
//  Created by Mostafa Mahmoud on 22/03/2024.
//

import UIKit

extension UIViewController {

    // MARK: - Methods
    public func addFullScreen(childViewController child: UIViewController, animation: Bool = true, options: UIView.AnimationOptions = []) {
        guard child.parent == nil else {
            return
        }

        addChild(child)
        if animation {
            UIView.transition(with: view, duration: 0.25, options: options.isEmpty ? .transitionCrossDissolve : options, animations: {
                self.view.addSubview(child.view)
                self.view.bringSubviewToFront(child.view)
            }, completion: nil)
        } else {
            view.addSubview(child.view)
        }

        child.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            view.leadingAnchor.constraint(equalTo: child.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: child.view.trailingAnchor),
            view.topAnchor.constraint(equalTo: child.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: child.view.bottomAnchor)
        ]
        constraints.forEach { $0.isActive = true }
        view.addConstraints(constraints)

        child.didMove(toParent: self)
    }

    public func remove(childViewController child: UIViewController?) {
        guard let child = child else {
            return
        }

        guard child.parent != nil else {
            return
        }

        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}

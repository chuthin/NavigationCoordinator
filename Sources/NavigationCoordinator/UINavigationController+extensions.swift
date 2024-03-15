//
//  UINavigationController+extensions.swift
//  
//
//  Created by Chu Thin on 15/03/2024.
//

import Foundation
import UIKit
public extension UINavigationController {
    public func pushViewController(
        _ viewController: UIViewController,
        animated: Bool,
        completion:(() -> Void)?)
    {
        pushViewController(viewController, animated: animated)

        guard animated, let coordinator = transitionCoordinator else {
            DispatchQueue.main.async { completion?() }
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion?() }
    }

    public func popViewController(
        animated: Bool,
        completion:(() -> Void)?)
    {
        popViewController(animated: animated)

        guard animated, let coordinator = transitionCoordinator else {
            DispatchQueue.main.async { completion?() }
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion?() }
    }
}

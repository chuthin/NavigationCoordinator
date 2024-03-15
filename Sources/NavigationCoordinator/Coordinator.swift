//
//  Coordinator.swift
//
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation
import UIKit
import SwiftUI
import Combine
/**
 A coordinator class responsible for managing navigation within a SwiftUI-based iOS application.

 The Coordinator class conforms to the ObservableObject protocol, allowing it to be used as an observable object within SwiftUI views.
 */
open class Coordinator : ObservableObject {
    /// The navigation controller used for managing the navigation stack.
    public var navigationController: UINavigationController

    /// The starting route to be executed when the coordinator is initialized.
    public let startingRoute: Routable?

    /**
     Initializes the coordinator with a navigation controller and an optional starting route.

     - Parameter navigationController: The navigation controller used for managing the navigation stack. Default value is a new instance of UINavigationController.
     - Parameter startingRoute: The starting route to be executed. Default value is nil.
     */

    public init(navigationController: UINavigationController = .init(), startingRoute: Routable? = nil) {
        self.navigationController = navigationController
        self.startingRoute = startingRoute
        if let start = startingRoute {
            execute(start)
        }
    }

    /**
     Executes a route synchronously.

     - Parameter route: The route to execute.
     - Parameter animated: A Boolean value indicating whether the transition should be animated. Default value is true.
     - Parameter environmentObjects: An array of ObservableObjects to pass as environment objects to SwiftUI views. Default value is an empty array.
     */
    public func execute(_ route: Routable,animated: Bool = true , environmentObjects:[any ObservableObject] = [] ) {
        var envi = environmentObjects
        envi.append(self)
        execute(route.route,animated: animated , environmentObjects: envi)
    }

    /**
     Executes a route asynchronously.

     - Parameter route: The route to execute.
     - Parameter animated: A Boolean value indicating whether the transition should be animated. Default value is true.
     - Parameter environmentObjects: An array of ObservableObjects to pass as environment objects to SwiftUI views. Default value is an empty array.
     */
    public func execute(_ route: Routable, animated: Bool = true, environmentObjects:[any ObservableObject] = []) async  {
        await withCheckedContinuation { continuation in
            execute(route.route, animated: animated, completion: {
                continuation.resume(returning: ())
            }, environmentObjects: environmentObjects)
        }
    }

    /**
     Pops the top view controller from the navigation stack.

     - Parameter animated: A Boolean value indicating whether the transition should be animated. Default value is true.
     */

    public func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }

    /**
     Pops all the view controllers on the stack except the root view controller.

     - Parameter animated: A Boolean value indicating whether the transition should be animated. Default value is true.
     */
    public func popToRoot(nimated: Bool = true) {
        navigationController.popToRootViewController(animated: nimated)
    }
    /**
     Dismisses the view controller that was presented modally by the view controller in the navigation stack.

     - Parameter animated: A Boolean value indicating whether the transition should be animated. Default value is true.
     */

    public func dismis(animated: Bool = true) {
        navigationController.dismiss(animated: true)
    }

    /**
     Executes a specific route type.

     - Parameter route: The route type to execute.
     - Parameter animated: A Boolean value indicating whether the transition should be animated. Default value is true.
     - Parameter completion: A closure to be executed after the transition is completed. Default value is nil.
     - Parameter environmentObjects: An array of ObservableObjects to pass as environment objects to SwiftUI views. Default value is an empty array.
     */

    public func execute(_ route: RouteType, animated: Bool = true, completion:(() -> Void)? = nil,environmentObjects:[any ObservableObject] = [] ) {
        switch route {
        case .push(let view, animated: _):
            DispatchQueue.main.async {[ weak self] in
                if let `self` = self {
                    var viewWithCoordinator = view
                    for envi in environmentObjects {
                        viewWithCoordinator = viewWithCoordinator.environmentObject(envi)
                    }

                    let viewController = UIHostingController(rootView: AnyView(viewWithCoordinator) )
                    self.navigationController.pushViewController(viewController, animated: animated,completion: completion)
                }
            }

        case .root(let view):
            DispatchQueue.main.async {[ weak self] in
                if let `self` = self {
                    var viewWithCoordinator = view
                    for envi in environmentObjects {
                        viewWithCoordinator = viewWithCoordinator.environmentObject(envi)
                    }
                    let viewController = UIHostingController(rootView: AnyView(viewWithCoordinator))
                    navigationController.setViewControllers([viewController], animated: false)
                }
            }
        case .presentModally(let view):
            DispatchQueue.main.async {[ weak self] in
                if let `self` = self {
                    var viewWithCoordinator = view
                    for envi in environmentObjects {
                        viewWithCoordinator = viewWithCoordinator.environmentObject(envi)
                    }
                    let viewController = UIHostingController(rootView: AnyView(viewWithCoordinator))
                    viewController.modalPresentationStyle = .pageSheet
                    viewController.modalTransitionStyle = .coverVertical
                    self.navigationController.present(viewController, animated: animated, completion: completion)
                }
            }

        case .persentFullscreen(let view):
            DispatchQueue.main.async {[ weak self] in
                if let `self` = self {
                    var viewWithCoordinator = view
                    for envi in environmentObjects {
                        viewWithCoordinator = viewWithCoordinator.environmentObject(envi)
                    }
                    let viewController = UIHostingController(rootView: AnyView(viewWithCoordinator))
                    viewController.modalPresentationStyle = .fullScreen
                    viewController.modalTransitionStyle = .coverVertical
                    self.navigationController.present(viewController, animated: animated, completion: completion)
                }
            }
        case .open(let url):
            UIApplication.shared.open(url)
        }
    }
}




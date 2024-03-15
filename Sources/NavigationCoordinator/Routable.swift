//
//  Routable.swift
//
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation
import SwiftUI
/// A protocol representing a routable object that encapsulates a navigation route.
public protocol Routable {
    /// The route associated with this routable object.
    var route: RouteType { get }
}

/// An enumeration defining different types of navigation routes.
public enum RouteType {
    /// Pushes a view onto the navigation stack.
    /// - Parameters:
    ///   - view: The view to be pushed onto the stack.
    ///   - animated: A Boolean value indicating whether the transition should be animated. Default is `true`.
    case push(_ view: any View, animated: Bool = true)

    /// Sets the specified view as the root view controller.
    /// - Parameter view: The view to be set as the root.
    case root(_ view: any View)

    /// Presents a view modally.
    /// - Parameter view: The view to be presented modally.
    case presentModally(_ view: any View)

    /// Presents a view in full screen.
    /// - Parameter view: The view to be presented in full screen.
    case persentFullscreen(_ view: any View)

    /// Opens a specified URL.
    /// - Parameter url: The URL to be opened.
    case open(_ url: URL)
}

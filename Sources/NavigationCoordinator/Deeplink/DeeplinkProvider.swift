//
//  DeeplinkProvider.swift
//
//
//  Created by Chu Thin on 15/03/2024.
//

import Foundation

/// A protocol defining the behavior of a deep link provider, which manages deep link routing within the application.
public protocol DeeplinkProvider {
    /// Appends a deep link assembly to the provider.
    /// - Parameter assembly: The deep link assembly to be appended.
    func append(assembly: DeeplinkAssembly)

    /// Opens the provided URL using deep link routing.
    /// - Parameter url: The URL to be opened using deep link routing.
    func open(url: URL, environmentObjects:[any ObservableObject]?)

    /// Sets the error handler for handling unavailable or unsupported deep link transitions.
    /// - Parameter errorHandler: The error handler to be set.
    func set(errorHandler: DeeplinkErrorHandlerProtocol)
}

/// A protocol defining the behavior of a deep link error handler, which handles errors related to deep link transitions.
public protocol DeeplinkErrorHandlerProtocol {
    /// Handles an unavailable deep link transition.
    func handleUnavailableTransition()

    /// Handles an unsupported deep link transition.
    func handleUnsupportedTransition()
}

/// A protocol defining the behavior of a deep link assembly, which maps deep link keys to routable objects.
public protocol DeeplinkAssembly {
    /// Retrieves the routable object associated with the specified key and query items.
    /// - Parameters:
    ///   - key: The key associated with the deep link.
    ///   - queryItems: Optional query items associated with the deep link.
    /// - Returns: A routable object representing the destination of the deep link, or nil if not found.
    func endpoint(for key: String, queryItems: [URLQueryItem]?) -> Routable?
}

/// A protocol defining the behavior of a feature-specific deep link handler.
public protocol FeatureDeeplink {
    /// A type property representing the module associated with the feature deep link.
    static var module: Self { get }

    /// Checks if a transition is available for the specified key within the feature.
    /// - Parameter key: The key associated with the deep link.
    /// - Returns: A Boolean value indicating whether a transition is available for the specified key.
    func isTransitionAvailable(for key: String) -> Bool
}

//
//  Coordinator+DeeplinkProvider.swift
//
//
//  Created by Chu Thin on 15/03/2024.
//

import Foundation
/// Extension of the `Coordinator` class to conform to the `DeeplinkProvider` protocol, enabling deep link handling.
extension Coordinator: DeeplinkProvider {
    /// Appends a deep link assembly to the coordinator's list of assemblies.
    /// - Parameter assembly: The deep link assembly to be appended.
    public func append(assembly: DeeplinkAssembly) {
        assemblies.append(assembly)
    }

    /// Opens the provided URL using deep link routing, if a matching endpoint is found in the registered assemblies.
    /// - Parameter url: The URL to be opened using deep link routing.
    /// - environmentObjects : Optional environment objects to be passed along with the view during navigation.
    public func open(url: URL, environmentObjects:[any ObservableObject]? = nil) {
        for assembly in assemblies {
            // Extracts the endpoint path from the URL
            guard let endpointPath = url.endpointPath,
                  // Resolves the endpoint type using the assembly
                  let endpointType = assembly.endpoint(for: endpointPath, queryItems: URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems) else { continue }
            // Executes the resolved endpoint type
            execute(endpointType, environmentObjects: environmentObjects ?? [])
            return
        }
        // Handles the case where no matching endpoint is found
        errorHandler?.handleUnsupportedTransition()
    }

    /// Sets the error handler for handling unavailable or unsupported deep link transitions.
    /// - Parameter errorHandler: The error handler to be set.
    public func set(errorHandler: DeeplinkErrorHandlerProtocol) {
        self.errorHandler = errorHandler
    }
}

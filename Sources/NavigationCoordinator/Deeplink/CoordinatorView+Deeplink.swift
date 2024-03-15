//
//  File.swift
//
//
//  Created by Chu Thin on 15/03/2024.
//

import Foundation
/// Extension of the `CoordinatorView` struct to add functionality related to deep link handling.
extension CoordinatorView {
    /// Appends a deep link assembly to the associated coordinator's list of assemblies.
    /// - Parameter value: The deep link assembly to be appended.
    /// - Returns: The modified `CoordinatorView` instance.
    public func append(_ value: DeeplinkAssembly) -> Self {
        self.coordinator.append(assembly: value)
        return self
    }

    /// Sets the error handler for handling unavailable or unsupported deep link transitions.
    /// - Parameter value: The error handler to be set.
    /// - Returns: The modified `CoordinatorView` instance.
    public func deeplinkHanldeError(_ value: DeeplinkErrorHandlerProtocol) -> Self {
        self.coordinator.set(errorHandler: value)
        return self
    }
}

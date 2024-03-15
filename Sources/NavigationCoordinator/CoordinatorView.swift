//
//  CoordinatorView.swift
//
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation
import SwiftUI
import UIKit
/// A view that represents the navigation coordinator within a SwiftUI view hierarchy.
public struct CoordinatorView {
    /// The coordinator responsible for managing navigation within the application.
    var coordinator: Coordinator

    /// Initializes a new `CoordinatorView` with the provided coordinator.
    /// - Parameter coordinator: The coordinator to be associated with the view.
    public init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}

extension CoordinatorView: UIViewControllerRepresentable {
    /// Creates a `UINavigationController` instance based on the coordinator's navigation controller.
    /// - Parameter context: The context in which the view is being created.
    /// - Returns: A `UINavigationController` instance.
    public func makeUIViewController(context _: Context) -> UINavigationController {
        return coordinator.navigationController
    }

    /// Updates the view controller with the coordinator's navigation controller.
    /// - Parameters:
    ///   - uiViewController: The view controller to be updated.
    ///   - context: The context in which the view is being updated.
    public func updateUIViewController(_ uiViewController: UINavigationController, context _: Context) {
        coordinator.navigationController = uiViewController
    }
}

//
//  NavigationCoordinator.swift
//
//
//  Created by Chu Thin on 14/03/2024.
//

import SwiftUI

/// A SwiftUI view representing a navigation coordinator, which manages navigation within the application.
public struct NavigationCoordinator<Content: View>: View {
    /// The navigation coordinator responsible for managing navigation transitions.
    @EnvironmentObject var navigation: Coordinator

    /// A closure that builds the content of the view hierarchy associated with the navigation coordinator.
    private let builder: (Coordinator) -> Content

    /// Initializes a new `NavigationCoordinator` with the provided content builder closure.
    /// - Parameter builder: A closure that builds the content of the view hierarchy associated with the navigation coordinator.
    public init(builder: @escaping (Coordinator) -> Content) {
        self.builder = builder
    }

    /// The body of the navigation coordinator, representing the view hierarchy managed by the coordinator.
    public var body: some View {
        NavigationView {
            builder(self.navigation)
        }
    }
}

//
//  ExampleApp.swift
//  Example
//
//  Created by Chu Thin on 14/03/2024.
//

import SwiftUI
import NavigationCoordinator
@main
struct ExampleApp: App {
    var appCoordinator: Coordinator = .init(startingRoute: AppRoute.home)

    var body: some Scene {
        WindowGroup {
            TabView {
                CoordinatorView(coordinator: appCoordinator)
                    .environmentObject(ShoppingCartManager())
                    .tag("home")
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }

                SettingView()
                    .tag("setting")
                    .tabItem {
                        Image(systemName: "gearshape.circle.fill")
                        Text("Setting")
                    }

            }
        }
    }
}

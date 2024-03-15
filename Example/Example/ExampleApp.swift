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
    private var cartManager = ShoppingCartManager()
    var body: some Scene {
        WindowGroup {
            TabView {
                CoordinatorView(coordinator: appCoordinator)
                    .append(AppDeeplink.module)
                    .environmentObject(cartManager)
                    .tag("home")
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .onOpenURL(perform: { url in
                        //deeplink-service://food?id=0
                        //deeplink-service://drink?id=0
                        //deeplink-service://desert?id=0
                        //deeplink-service://cart

                        if let endpointPath = url.endpointPath, endpointPath == AppDeeplink.AppKey.cart.rawValue {
                            appCoordinator.open(url: url, environmentObjects: [cartManager])
                        }
                        else {
                            appCoordinator.open(url: url)
                        }
                    })


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

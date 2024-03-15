//
//  HomeView.swift
//  Example
//
//  Created by Chu Thin on 14/03/2024.
//

import SwiftUI
import NavigationCoordinator

struct HomeView: View {
    @EnvironmentObject private var cartManager: ShoppingCartManager
    let data = (1...100).map { "Item \($0)" }

    let section1Data = foods
    let section2Data = drinks
    let section3Data = desserts

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationCoordinator { navigation in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    Section(header: Text("Foods")) {
                        ForEach(section1Data, id: \.self) { item in
                            MenuCardView(item: item, didTapAdd: { value in
                                cartManager.add(value)
                            })
                            .onTapGesture {
                                navigation.execute(AppRoute.food(item))
                            }
                        }
                    }

                    Section(header: Text("Drinks")) {
                        ForEach(section2Data, id: \.self) { item in
                            MenuCardView(item: item, didTapAdd: { value in
                                cartManager.add(value)
                            })
                            .onTapGesture {
                                navigation.execute(AppRoute.drink(item))
                            }
                        }
                    }

                    Section(header: Text("Desserts")) {
                        ForEach(section3Data, id: \.self) { item in
                            MenuCardView(item: item, didTapAdd: { value in
                                cartManager.add(value)
                            })
                            .onTapGesture {
                                navigation.execute(AppRoute.dessert(item))
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    CartButton(count: cartManager.items.count) {
                        navigation.execute(AppRoute.cart, environmentObjects :[cartManager])
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(Coordinator())
        .environmentObject(ShoppingCartManager())
}

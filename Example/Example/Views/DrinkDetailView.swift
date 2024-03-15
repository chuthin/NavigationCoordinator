//
//  DrinkDetailView.swift
//  Example
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation
import SwiftUI
import NavigationCoordinator

struct DrinkDetailView: View {

    @EnvironmentObject private var cartManager: ShoppingCartManager

    let drink: Drink

    var body: some View {
        NavigationCoordinator { navigation in
            List {
                Section {
                    LabelContent(key: "Icon", value: drink.name)
                    LabelContent(key: "Name", value: drink.title)
                    LabelContent(key: "Price", value: NSDecimalNumber(decimal: drink.price).stringValue)
                    LabelContent(key: "Fizzy?", value: drink.isFizzy ? "✅" : "❌")
                }

                Section(header: Text("Description")) {
                    Text(drink.description)
                }

                Section {
                    Button {
                        cartManager.add(drink)
                        navigation.pop()
                    } label: {
                        Label("Add to cart", systemImage: "cart")
                    }
                }

            }
            .listStyle(.insetGrouped)
            .navigationTitle(drink.title)
        }

    }
}

struct DrinkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DrinkDetailView(drink: drinks[0])
                .environmentObject(ShoppingCartManager())
                .environmentObject(Coordinator())
        }
    }
}

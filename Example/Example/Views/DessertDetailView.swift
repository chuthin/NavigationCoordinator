//
//  DessertDetailView.swift
//  Example
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation
import SwiftUI
import NavigationCoordinator
struct DessertDetailView: View {

    @EnvironmentObject private var cartManager: ShoppingCartManager

    let dessert: Dessert
    var body: some View {
        NavigationCoordinator { navigation in
            List {
                Section {
                    LabelContent(key: "Icon", value: dessert.name)
                    LabelContent(key:"Name", value: dessert.title)
                    LabelContent(key: "Price", value: NSDecimalNumber(decimal: dessert.price).stringValue)
                    LabelContent(key:"Cold?", value: dessert.isCold ? "✅" : "❌")
                }

                Section(header: Text("Description")) {
                    Text(dessert.description)
                }

                Section {
                    Button {
                        cartManager.add(dessert)
                        navigation.pop()
                    } label: {
                        Label("Add to cart", systemImage: "cart")

                    }
                }

            }
            .listStyle(.insetGrouped)
            .navigationTitle(dessert.title)
        }
    }
}

struct DessertDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DessertDetailView(dessert: desserts[0])
                .environmentObject(ShoppingCartManager())
                .environmentObject(Coordinator())
        }
    }
}

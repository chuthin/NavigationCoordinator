//
//  CartView.swift
//  Example
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation
import SwiftUI
import NavigationCoordinator
struct CartView: View {

    @EnvironmentObject private var cartManager: ShoppingCartManager

    var body: some View {
        NavigationCoordinator { navigation in
            List {
                let items = cartManager.getGroupedCart()
                ForEach(items.keys.sorted(by: { $0.title < $1.title })) { key in
                    let count = items[key]!
                    let price = key.price * Decimal(count)
                    LabelContent(key: "x\(count) \(key.name) \(key.title)", value: NSDecimalNumber(decimal: price).stringValue)
                }

                if let promo = cartManager.promo {
                    Section {
                        LabelContent(key: promo.desc, value: promo.pct != nil ? NSDecimalNumber(decimal: promo.pct ?? 0).stringValue : "N/A")
                    }
                }

                Section {
                    LabelContent(key: "Total", value: NSDecimalNumber(decimal: cartManager.getTotal()).stringValue)
                }
            }
            .navigationTitle("Basket")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Close") {
                        navigation.dismis()
                    }
                }
            }
        }
    }
}

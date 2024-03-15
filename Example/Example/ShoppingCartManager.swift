//
//  ShoppingCartManager.swift
//  Example
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation

import Foundation

struct CartItem: Identifiable, Hashable {
    let id: String
    let title: String
    let name: String
    let price: Decimal

    init(_ item: any MenuItem) {
        self.id = "\(item.name)_\(item.title)"
        self.title = item.title
        self.name = item.name
        self.price = item.price
    }
}

struct PromoData {
    let desc: String
    let pct: Decimal?
}

final class ShoppingCartManager: ObservableObject {

    @Published private(set) var items: [CartItem] = []
    @Published private(set) var promo: PromoData?

    func add(_ item: any MenuItem) {
        items.append(CartItem(item))
    }

    func remove(id: String) {
        items.removeAll(where: { $0.id == id })
    }

    func getGroupedCart() -> [CartItem: Int] {
        var itemCounts = [CartItem: Int]()
        for item in items {
            itemCounts[item, default: 0] += 1
        }
        return itemCounts
    }

    func getTotal() -> Decimal {
        let total = items.reduce(0) { $0 + $1.price }
        guard let discount = promo?.pct else { return total }
        return total - (discount * total)
    }

    func set(promo: PromoData) {
        self.promo = promo
    }

    func removePromo() {
        self.promo = nil
    }
}

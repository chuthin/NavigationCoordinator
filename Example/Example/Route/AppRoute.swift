//
//  AppRoute.swift
//  Example
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation
import NavigationCoordinator

enum AppRoute {
    case home
    case food(Food)
    case drink(Drink)
    case dessert(Dessert)
    case allergies([Allergie])
    case ingredients([Ingredient])
    case cart
}

extension AppRoute : Routable {
    public var route: RouteType {
        switch self {
        case .home:
            return .push(HomeView(), animated: true)
        case .food(let value):
            return .push(FoodDetailView(food: value), animated: true)
        case .drink(let value):
            return .push(DrinkDetailView(drink: value), animated: true)
        case .dessert(let value):
            return .push(DessertDetailView(dessert: value), animated: true)
        case .allergies(let value):
            return .push(AllergiesDetailView(allergies: value), animated: true)
        case .ingredients(let value):
            return .push(IngredientsDetailView(ingredients: value), animated: true)
        case .cart:
            return .persentFullscreen(CartView())
        }
    }
}

extension AppRoute : Equatable {}

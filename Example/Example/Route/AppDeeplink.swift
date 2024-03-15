//
//  AppDeeplink.swift
//  Example
//
//  Created by Chu Thin on 15/03/2024.
//

import Foundation
import NavigationCoordinator
public struct AppDeeplink : FeatureDeeplink {
    public static var module: AppDeeplink = AppDeeplink()

    public enum AppKey: String {
        case cart
        case food
        case drink
        case desert
        case id
    }

    public func isTransitionAvailable(for key: String) -> Bool {
        switch key {
        case AppKey.cart.rawValue, AppKey.food.rawValue, AppKey.drink.rawValue, AppKey.desert.rawValue:
            return true
        default:
            return false
        }
    }
}

extension AppDeeplink : DeeplinkAssembly {
    public func endpoint(for key: String, queryItems: [URLQueryItem]?) -> Routable? {
        switch key {
        case AppKey.cart.rawValue:
            return AppRoute.cart
        case AppKey.food.rawValue:
            if let id = queryItems?.valueOf(AppDeeplink.AppKey.id.rawValue),let index = Int(id), index >= 0, index < foods.count {
                return AppRoute.food(foods[index])
            }
            return nil
        case AppKey.drink.rawValue:
            if let id = queryItems?.valueOf(AppDeeplink.AppKey.id.rawValue),let index = Int(id), index >= 0, index < drinks.count {
                return AppRoute.drink(drinks[index])
            }
            return nil
        case AppKey.desert.rawValue:
            if let id = queryItems?.valueOf(AppDeeplink.AppKey.id.rawValue),let index = Int(id), index >= 0, index < desserts.count {
                return AppRoute.dessert(desserts[index])
            }
            return nil
        default:
            return nil
        }
    }
}

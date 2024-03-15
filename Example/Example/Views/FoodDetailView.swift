//
//  DetailView.swift
//  Example
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation
import SwiftUI
import NavigationCoordinator
struct FoodDetailView: View {
    @EnvironmentObject private var cartManager: ShoppingCartManager
    @State var route:AppRoute?
    let food: Food
    var body: some View {
        NavigationCoordinator { navigation in
            List {
                Section {
                    LabelContent(key :"Icon", value: food.name)
                    LabelContent(key: "Name", value: food.title)
                    LabelContent(key: "Price", value: NSDecimalNumber(decimal: food.price).stringValue)
                }
                Section(header: Text("Description")){
                    Text(food.description)
                }

                if food.allergies?.isEmpty == false ||
                    food.ingredients?.isEmpty == false {
                    Section(header: Text("Dietry")){
                        if let ingredients = food.ingredients {
                            let countVw = Text("x\(ingredients.count)").font(.footnote).bold()
                            Text("\(countVw) Ingredients")
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    route = AppRoute.ingredients(food.ingredients ?? [])
                                }
                        }

                        if let allergies = food.allergies {

                            let countVw = Text("x\(allergies.count)").font(.footnote).bold()
                            Text("\(countVw) Allergies")
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    route = AppRoute.ingredients(food.ingredients ?? [])
                                }
                        }
                    }
                }

                Section {
                    Button {
                        cartManager.add(food)
                        navigation.pop()
                    } label: {
                        Label("Add to cart", systemImage: "cart")
                    }
                }
            }
            .onChange(of: route, perform: { value in
                if let route = value {
                    navigation.execute(route)
                    self.route = nil
                }
            })
            .listStyle(.insetGrouped)
            .navigationTitle(food.title)
        }

    }
}

struct LabelContent : View {
    var key: String
    var value:String
    var body: some View {
        HStack {
            Text(key)
            Spacer()
            Text(value).multilineTextAlignment(.trailing)
        }
    }
}


struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(food: foods[0])
            .environmentObject(ShoppingCartManager())
            .environmentObject(Coordinator())
    }
}

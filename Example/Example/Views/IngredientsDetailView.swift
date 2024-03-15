//
//  IngredientsDetailView.swift
//  Example
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation
import SwiftUI

struct IngredientsDetailView: View {

    let ingredients: [Ingredient]

    var body: some View {
        List(ingredients, id: \.name) { ingredient in
            LabelContent(key: ingredient.name, value: "\(ingredient.quantity) %")
        }
        .navigationTitle("Ingredients")
    }
}

struct IngredientsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsDetailView(ingredients: foods[0].ingredients!)
    }
}

//
//  Models.swift
//  Example
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation


protocol MenuItem: Identifiable, Hashable {
    var id: String { get }
    var name: String { get }
    var title: String { get }
    var price: Decimal { get }
}


struct Ingredient: Hashable {
    let name: String
    let quantity: Double
}

struct Allergie: Hashable {
    let name: String
}




struct Food : MenuItem {
    var id: String { "\(name)_\(title)" }
    let name: String
    let title: String
    let description: String
    let price: Decimal
    let ingredients: [Ingredient]?
    let allergies: [Allergie]?
}

struct Dessert: MenuItem {
    var id: String { "\(name)_\(title)" }
    let name: String
    let title: String
    let description: String
    let isCold: Bool
    let price: Decimal
    let ingredients: [Ingredient]?
    let allergies: [Allergie]?
}

struct Drink: MenuItem {
    var id: String { "\(name)_\(title)" }
    let name: String
    let title: String
    let description: String
    let isFizzy: Bool
    let price: Decimal
    let ingredients: [Ingredient]?
    let allergies: [Allergie]?
}

let foods: [Food] = [
    Food(name: "🌯",
         title: "Burrito",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 7.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: [
            Allergie(name: "Allergie 1"),
            Allergie(name: "Allergie 2"),
            Allergie(name: "Allergie 3")
         ]),
    Food(name: "🍜",
         title: "Ramen",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 10.99,
         ingredients: [
            Ingredient(name: "Ingredient 2", quantity: 20),
            Ingredient(name: "Ingredient 3", quantity: 11),
            Ingredient(name: "Ingredient 4", quantity: 15)
         ],
         allergies: nil),
    Food(name: "🍔",
         title: "Burger",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 4.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: nil),
    Food(name: "🍕",
         title: "Pizza",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 1.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: [
            Allergie(name: "Allergie 1"),
            Allergie(name: "Allergie 2"),
            Allergie(name: "Allergie 3")
         ]),
    Food(name: "🌭",
         title: "Hotdog",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 0.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: nil),
    Food(name: "🧆",
         title: "Falafel",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 2.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: [
            Allergie(name: "Allergie 1"),
            Allergie(name: "Allergie 2"),
            Allergie(name: "Allergie 3")
         ]),
    Food(name: "🍝",
         title: "Spag Bol",
         description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
         price: 12.99,
         ingredients: [
            Ingredient(name: "Ingredient 1", quantity: 10),
            Ingredient(name: "Ingredient 2", quantity: 5),
            Ingredient(name: "Ingredient 3", quantity: 5)
         ],
         allergies: nil)
]


let drinks: [Drink] = [
    Drink(name: "🥤",
          title: "Soda",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: true,
          price: 2.99,
          ingredients: [
             Ingredient(name: "Ingredient 1", quantity: 10),
             Ingredient(name: "Ingredient 2", quantity: 5),
             Ingredient(name: "Ingredient 3", quantity: 5)
          ],
          allergies: nil),
    Drink(name: "🧋",
          title: "Boba Tea",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: false,
          price: 3.99,
          ingredients: [
             Ingredient(name: "Ingredient 1", quantity: 10),
             Ingredient(name: "Ingredient 2", quantity: 5),
             Ingredient(name: "Ingredient 3", quantity: 5)
          ],
          allergies: [
             Allergie(name: "Allergie 1"),
             Allergie(name: "Allergie 2"),
             Allergie(name: "Allergie 3")
          ]),
    Drink(name: "🧃",
          title: "Juice",
          description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          isFizzy: false,
          price: 0.99,
          ingredients: [
             Ingredient(name: "Ingredient 1", quantity: 10),
             Ingredient(name: "Ingredient 2", quantity: 5),
             Ingredient(name: "Ingredient 3", quantity: 5)
          ],
          allergies: nil)
]


let desserts: [Dessert] = [

    Dessert(name: "🍦",
            title: "Ice Cream",
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            isCold: true,
            price: 0.99,
            ingredients: [
               Ingredient(name: "Ingredient 1", quantity: 10),
               Ingredient(name: "Ingredient 2", quantity: 5),
               Ingredient(name: "Ingredient 3", quantity: 5)
            ],
            allergies: [
               Allergie(name: "Allergie 1"),
               Allergie(name: "Allergie 2"),
               Allergie(name: "Allergie 3")
            ]),
    Dessert(name: "🍩",
            title: "Doughnut",
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            isCold: false,
            price: 0.99,
            ingredients: [
               Ingredient(name: "Ingredient 1", quantity: 10),
               Ingredient(name: "Ingredient 2", quantity: 5),
               Ingredient(name: "Ingredient 3", quantity: 5)
            ],
            allergies: [
               Allergie(name: "Allergie 1"),
               Allergie(name: "Allergie 2"),
               Allergie(name: "Allergie 3")
            ])
]

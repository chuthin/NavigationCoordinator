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

struct MenuCardView: View {
    let item: any MenuItem
    let didTapAdd: (_ item: any MenuItem) -> Void
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white
            VStack {
                Text(item.name)
                    .font(.system(size: 100))
                    .padding(.bottom, 64)
            }
            HStack(alignment: .bottom) {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .foregroundColor(.black)

                    Text(NSDecimalNumber(decimal: item.price).stringValue)
                        .foregroundColor(.black)
                        .font(.caption)
                }
                Spacer()
                Button() {
                    didTapAdd(item)
                } label: {
                    ZStack {
                        Color.blue
                        VStack {
                            Text("Add")
                        }
                    }
                }
                .frame(width:68, height: 30)
                .clipShape(Capsule())
                .padding(.trailing,8)
                .cornerRadius(6)

            }
            .padding(.bottom,8)
            .padding(.leading,8)
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 3)

    }
}


#Preview {
    HomeView()
        .environmentObject(Coordinator())
}

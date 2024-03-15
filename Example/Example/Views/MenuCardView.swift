//
//  MenuCardView.swift
//  Example
//
//  Created by Chu Thin on 15/03/2024.
//

import Foundation
import SwiftUI
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

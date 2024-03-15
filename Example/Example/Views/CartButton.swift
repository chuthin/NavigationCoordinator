//
//  CartButton.swift
//  Example
//
//  Created by Chu Thin on 14/03/2024.
//

import Foundation
import SwiftUI
struct CartButton: View {

    let count: Int
    let didTap: () -> ()

    var body: some View {
        ZStack {
            Button {
                didTap()
            } label: {
                Image(systemName: "cart")
                    .padding(4)
            }
            if count > 0 {
                badge
            }
        }
    }
}

private extension CartButton {

    var badge: some View {
        Text("\(count)")
            .foregroundColor(.white)
            .padding(6)
            .font(.caption2.bold())
            .background(
                Circle()
                    .fill(.red)
            )
            .offset(x: 2, y: -2)
    }
}


struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(count: 0) {

        }
        .previewLayout(.sizeThatFits)
        .padding()

        CartButton(count: 1) {

        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}

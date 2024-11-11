//
//  HeartButton.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/9/24.
//

import SwiftUI

struct HeartButton: View {
    var product: CodableProductModel
    @EnvironmentObject var shoppingBagViewModel: ShoppingBagViewModel
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack {
            Button(action: {
                if shoppingBagViewModel.isProductInWishlist(product: product) {
                    if let addedProduct = shoppingBagViewModel.productsAddedToCart.first(where: { $0.productID == product.id }) {
                        shoppingBagViewModel.removeBookFromWishlist(addedProduct: addedProduct, modelContext: modelContext)
                    }
                } else {
                    shoppingBagViewModel.addProductToWishlist(product: product, modelContext: modelContext)
                    print(product.title)
                }

            }, label: {
                Image(systemName: shoppingBagViewModel.isProductInWishlist(product: product) ? "heart.fill" : "heart")
                    .font(.system(size: 20))
            })
        }
    }
}

//#Preview {
//    HeartButton(product: CodableProductModel(title: "123", image: "123"))
//        .environmentObject(ShoppingBagViewModel())
//}

//
//  AddToCartButton.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/15/24.
//

import SwiftUI

struct AddToShoppingBagButton: View {
    var product: CodableProductModel
    @EnvironmentObject var shoppingBagViewModel: ShoppingBagViewModel
    @Environment(\.modelContext) private var modelContext
    
    
    var body: some View {
        VStack {
            Button(action: {
                if shoppingBagViewModel.isProductInShoppingBag(product: product) {
                    if let addedProduct = shoppingBagViewModel.productsAddedToShoppingBag.first(where: { $0.productID == product.id }) {
                        shoppingBagViewModel.removeProductFromShoppingBag(addedProduct: addedProduct, modelContext: modelContext)
                    }
                } else {
                    shoppingBagViewModel.addProductToShoppingBag(product: product, modelContext: modelContext)
                    print(product.title)
                }

            }, label: {
                Image(systemName: shoppingBagViewModel.isProductInShoppingBag(product: product) ? "cart.fill.badge.minus" : "cart.badge.plus")
                    .font(.system(size: 20))
            })
        }
    }
}

//#Preview {
//    AddToCartButton()
//}

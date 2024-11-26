//
//  HeartButton.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/9/24.
//

import SwiftUI

struct AddToFavouritesButton: View {
    var product: CodableProductModel
    @EnvironmentObject var favouritesPageViewModel: FavouritesPageViewModel
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            Button(action: {
                if favouritesPageViewModel.isProductInFavouritesPage(product: product) {
                    if let addedProduct = favouritesPageViewModel.productsAddedToFavouritesPage.first(where: { $0.productID == product.id }) {
                        favouritesPageViewModel.removeProductFromFavouritesPage(addedProduct: addedProduct, modelContext: modelContext)
                    }
                } else {
                    favouritesPageViewModel.addProductToFavouritesPage(product: product, modelContext: modelContext)
                    print(product.title)
                }
                
            }, label: {
                Image(systemName: favouritesPageViewModel.isProductInFavouritesPage(product: product) ? "heart.fill" : "heart")
                    .font(.system(size: 20))
            })
        }
    }
}

//#Preview {
//    HeartButton(product: CodableProductModel(title: "123", image: "123"))
//        .environmentObject(ShoppingBagViewModel())
//}

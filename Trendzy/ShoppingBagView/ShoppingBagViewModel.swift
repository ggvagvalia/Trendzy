//
//  ShoppingBagViewModel.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/8/24.
//

import Foundation
import SwiftData

class ShoppingBagViewModel: ObservableObject {
    @Published var productsAddedToCart: [ShoppingBagModel] = []
    
    func updateFavorites(from products: [ShoppingBagModel]) {
        productsAddedToCart = products
    }
    
    @MainActor
    func isProductInWishlist(product: CodableProductModel) -> Bool {
        productsAddedToCart.contains { $0.productID == product.id }
    }
    
    @MainActor
    func addProductToWishlist(product: CodableProductModel, modelContext: ModelContext) {
        let newAddedProduct = ShoppingBagModel(id: product.id, title: product.title, image: product.image)
        modelContext.insert(newAddedProduct)
        productsAddedToCart.append(newAddedProduct)
        try? modelContext.save()
    }
    
    func removeBookFromWishlist(addedProduct: ShoppingBagModel, modelContext: ModelContext) {
        modelContext.delete(addedProduct)
        productsAddedToCart.removeAll { $0.id == addedProduct.id}
        try? modelContext.save()
    }
}

//
//  ShoppingBagViewModel.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/8/24.
//

import Foundation
import SwiftData

class ShoppingBagViewModel: ObservableObject {
    @Published var productsAddedToShoppingBag: [ShoppingBagModel] = []
    
    func updateShoppingPage(from products: [ShoppingBagModel]) {
        productsAddedToShoppingBag = products
    }
    
    @MainActor
    func isProductInShoppingBag(product: CodableProductModel) -> Bool {
        productsAddedToShoppingBag.contains { $0.productID == product.id }
    }
    
    @MainActor
    func addProductToShoppingBag(product: CodableProductModel, modelContext: ModelContext) {
        let newAddedProduct = ShoppingBagModel(id: product.id, title: product.title, image: product.image, price: product.price ?? 00)
        modelContext.insert(newAddedProduct)
        productsAddedToShoppingBag.append(newAddedProduct)
        try? modelContext.save()
    }
    
    
    func removeBookFromShoppingBag(addedProduct: ShoppingBagModel, modelContext: ModelContext) {
        modelContext.delete(addedProduct)
        productsAddedToShoppingBag.removeAll { $0.id == addedProduct.id}
        try? modelContext.save()
    }

}

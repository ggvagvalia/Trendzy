//
//  FavouritesPageViewModel.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/15/24.
//

import Foundation
import SwiftData

class FavouritesPageViewModel: ObservableObject {
    @Published var productsAddedToFavouritesPage: [FavouritesPageModel] = []
    
    func updateFavouritesPage(from products: [FavouritesPageModel]) {
        productsAddedToFavouritesPage = products
    }
    
    @MainActor
    func isProductInFavouritesPage(product: CodableProductModel) -> Bool {
        productsAddedToFavouritesPage.contains { $0.productID == product.id }
    }
    
    @MainActor
    func addProductToFavouritesPage(product: CodableProductModel, modelContext: ModelContext) {
        let newAddedProduct = FavouritesPageModel(id: product.id, title: product.title, image: product.image, price: product.price ?? 00)
        modelContext.insert(newAddedProduct)
        productsAddedToFavouritesPage.append(newAddedProduct)
        try? modelContext.save()
    }
    
    
    func removeProductFromFavouritesPage(addedProduct: FavouritesPageModel, modelContext: ModelContext) {
        modelContext.delete(addedProduct)
        productsAddedToFavouritesPage.removeAll { $0.id == addedProduct.id}
        try? modelContext.save()
    }

}

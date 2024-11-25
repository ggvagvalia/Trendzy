//
//  FavouritesPageViewModel.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/15/24.
//

import SwiftUI
import SwiftData

//
//class FavouritesPageViewModel: ObservableObject {
//    @Published var productsAddedToFavouritesPage: [FavouritesPageModel] = []
//    
//    func updateFavouritesPage(from products: [FavouritesPageModel]) {
//        productsAddedToFavouritesPage = products
//    }
//    
//    @MainActor
//    func isProductInFavouritesPage(product: CodableProductModel) -> Bool {
//        productsAddedToFavouritesPage.contains { $0.productID == product.id }
//    }
//    
//    @MainActor
//    func addProductToFavouritesPage(product: CodableProductModel, modelContext: ModelContext) {
//        let newAddedProduct = FavouritesPageModel(id: product.id, title: product.title, image: product.image, price: product.price ?? 00)
//        modelContext.insert(newAddedProduct)
//        try? modelContext.save()
//        productsAddedToFavouritesPage.append(newAddedProduct)
//
//    }
//    
//    func removeBookFromFavouritesPage(addedProduct: FavouritesPageModel, modelContext: ModelContext) {
//        modelContext.delete(addedProduct)
//        try? modelContext.save()
//        productsAddedToFavouritesPage.removeAll { $0.id == addedProduct.id}
//
//    }
//    
//}

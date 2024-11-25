//
//  FavouritesPage.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/15/24.
//

import SwiftUI
import SwiftData

struct FavouritesPage: View {
//    @EnvironmentObject private var favouritesViewModel: FavouritesPageViewModel
//    @Environment(\.modelContext) private var context
//    @Query private var favouritesPageProducts: [FavouritesPageModel]

    var body: some View {
        Text("hiiii")
//        VStack {
//            ForEach(favouritesPageProducts, id: \.productID) { product in
//                Text(product.title)
//            }
//        }
//        .onAppear {
//            favouritesViewModel.updateFavouritesPage(from: favouritesPageProducts)
//            print("Fetched Favourites: \(favouritesPageProducts)") // Check if data is fetched properly
//
//        }
    }
}

#Preview {
    FavouritesPage()
        .environmentObject(ShoppingBagViewModel())
}

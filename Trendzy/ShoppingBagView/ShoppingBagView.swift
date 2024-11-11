//
//  ShoppingBagView.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/6/24.
//

import SwiftUI
import SwiftData

struct ShoppingBagView: View {
    @EnvironmentObject private var shoppingBagViewModel: ShoppingBagViewModel
    @Environment(\.modelContext) private var context
    @Query private var productsInCart: [ShoppingBagModel]
    @EnvironmentObject private var viewModel: MainPageViewModel

    
   
    var body: some View {
        VStack {
            ForEach(productsInCart, id: \.id) { product in
                HStack {
                    Text(product.title)
                    Spacer()
                    // MARK: - es moviedp-s appshic gadavitanooo!!!
                    HeartButton(product: CodableProductModel(id: product.productID, title: product.title, image: product.image))
                                           .environmentObject(shoppingBagViewModel)
                }
            }
        }
        .onAppear {

            shoppingBagViewModel.updateFavorites(from: productsInCart)
        }
    }
}

#Preview {
    ShoppingBagView()
        .environmentObject(ShoppingBagViewModel())
}

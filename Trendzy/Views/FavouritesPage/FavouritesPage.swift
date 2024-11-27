//
//  FavouritesPage.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/15/24.
//

import SwiftUI
import SwiftData

struct FavouritesPage: View {
    @EnvironmentObject private var favouritesViewModel: FavouritesPageViewModel
    @Environment(\.modelContext) private var context
    @Query private var productsInFavourites: [FavouritesPageModel]
    
    
    var body: some View {
        VStack {
            Text("Favourites" + "(\(productsInFavourites.count))")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .bold()
                .padding()
            
            ScrollView(.vertical) {
                ForEach(productsInFavourites, id: \.id) { product in
                    HStack(alignment: .top) {
                        let image = URL(string: product.image)
                        
                        AsyncImage(url: image) { image in
                            image
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: 75, height: 90)
                                .scaledToFill()
                                .shadow(radius: 5)
                        }
                    placeholder: {
                        ProgressView()
                    }
                        
                        VStack(alignment: .leading) {
                            JustifiedText(text: product.title)
                            Spacer()
                            JustifiedText(text: product.formattedPrice)
                        }

                        AddToFavouritesButton(product: CodableProductModel(id: product.productID, title: product.title, image: product.image))
                            .environmentObject(favouritesViewModel)
                        
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            favouritesViewModel.updateFavouritesPage(from: productsInFavourites)
        }
    }
}

//
//#Preview {
//    FavouritesPage()
//        .environmentObject(ShoppingBagViewModel())
//}

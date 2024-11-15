//
//  ProductDetailView.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/11/24.
//

import SwiftUI

struct ProductDetailView: View {
    let image: String
    let title: String
    var product: CodableProductModel
    @EnvironmentObject var shoppingBagViewModel: ShoppingBagViewModel
    
    var body: some View {
        VStack {
            let imageUurl = URL(string: image)
            AsyncImage(url: imageUurl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            HStack {
                Text(title)
                HeartButton(product: product, shoppingBagViewModel: _shoppingBagViewModel)
            }
        }
//        .frame(width: 50, height: 50)
        .padding()
    }
}

//#Preview {
//    ProductDetailView()
//}

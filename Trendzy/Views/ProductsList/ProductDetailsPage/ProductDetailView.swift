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
        ScrollView {
        VStack {
            //            let imageUurl = URL(string: image)
            //            AsyncImage(url: imageUurl) { image in
            //                image
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 100, height: 100)
            //            } placeholder: {
            //                ProgressView()
            //            }
            ImageView(imageJPG: image)
                .scaledToFit()
                .frame(width: screenWidth * 0.4, height: screenHeight * 0.2)
                .cornerRadius(16)
            
            HStack {
                Text(title)
                Spacer()
                AddToShoppingBagButton(product: product, shoppingBagViewModel: _shoppingBagViewModel)
            }
            
            VStack(alignment: .leading) {
                Text("Category")
                    .bold()
                    .padding(.top)
                Text(product.category?.rawValue ?? "-")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
            
            VStack(alignment: .leading) {
                Text("Description")
                    .bold()
                    .padding(.top)
                Text(product.description ?? "-")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding()
    }
}
}


//
//#Preview {
//    ProductDetailView(image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", title: "my tshirt aesfcfknal", product: CodableProductModel(title: "title", image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"))
//}

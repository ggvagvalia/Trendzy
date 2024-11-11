//
//  MainPageView.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/3/24.
//

import SwiftUI
import SwiftData

extension View {
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
}

struct MainPageView: View {
    @EnvironmentObject var mainPage: MainPageViewModel
    @EnvironmentObject var shoppingBagViewModel: ShoppingBagViewModel
    @Query var addedProducts: [ShoppingBagModel] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollableListView()
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        ForEach(mainPage.productModel) { product in
                            NavigationLink(value: product) {
                                ProductView(
                                    productTitle: product.title,
                                    productImage: product.image,
                                    product: product)
                            }
                        }
                    })
                }
            }
            .navigationDestination(for: CodableProductModel.self) { product in
                ProductDetailView(image: product.image, title: product.title, product: product)
            }
            .onAppear {
                shoppingBagViewModel.productsAddedToCart = addedProducts
            }
        }
    }
}

private struct ProductView: View {
    var productTitle: String
    var productImage: String
    var product: CodableProductModel
    @EnvironmentObject var shoppingBagViewModel: ShoppingBagViewModel
    
    var body: some View {
        VStack {
            let imageURL = URL(string: productImage)
            
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
            }
            HStack(alignment: .top) {
                JustifiedText(text: productTitle)
                    .font(.caption)
                    .bold()
                    .lineLimit(2)
                HeartButton(product: product, shoppingBagViewModel: _shoppingBagViewModel)
            }
            .padding()
        }
    }
}

private struct ProductDetailView: View {
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
    }
}

struct JustifiedText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .lineLimit(nil)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MainPageView()
        .environmentObject(MainPageViewModel())
        .environmentObject(ShoppingBagViewModel())
}

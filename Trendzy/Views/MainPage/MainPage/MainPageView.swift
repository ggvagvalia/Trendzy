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
        ZStack {
            VStack {
                ZStack {
                    let imageURL = URL(string: productImage)
                    
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                        
                            .cornerRadius(20)
                        // .frame(width: 100, height: 100)
                            .frame(width: 120, height: 150)
                            .shadow(radius: 5)
                        //                            .blur(radius: product.inStock == 0 ? 5 : 0)
                    } placeholder: {
                        ProgressView()
                    }
                    VStack {
                        Spacer()
                        HStack {
                            JustifiedText(text: productTitle)
                                .font(.system(size: 18))
                            Spacer()
                            HeartButton(product: product, shoppingBagViewModel: _shoppingBagViewModel)
                        }
                        .bold()
                        .padding(.leading, 4)
                        .padding(.trailing, 4)
                        .padding(.top, 8)
                        .padding(.bottom, 8)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                    }
                    
                }
                VStack {
                    HStack() {
                        Text("ფასი: ")
                            .bold()
                        Text("\(product.formattedPrice) ლ")
                        Spacer()
                    }
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 17))
                    .padding(.leading, 2.5)
                }
                .padding(.leading, 2.5)
                .padding(.trailing, 2.5)
            }
            .foregroundStyle(.black)
            .frame(width: 175, height: 230)

        }
        
        
        //                VStack {
        //                    let imageURL = URL(string: productImage)
        //
        //                    AsyncImage(url: imageURL) { image in
        //                        image
        //                            .resizable()
        //                            .scaledToFit()
        //                            .frame(width: 100, height: 100)
        //                    } placeholder: {
        //                        ProgressView()
        //                    }
        //                    HStack(alignment: .top) {
        //                        JustifiedText(text: productTitle)
        //                            .font(.caption)
        //                            .bold()
        //                            .lineLimit(2)
        //                        HeartButton(product: product, shoppingBagViewModel: _shoppingBagViewModel)
        //                    }
        //                    .padding()
        //                }
    }
}


struct JustifiedText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .lineLimit(1)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MainPageView()
        .environmentObject(MainPageViewModel())
        .environmentObject(ShoppingBagViewModel())
}

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
    @Query var shoppingBagProducts: [ShoppingBagModel] = []
    private var categories = Categories.allCases.map { $0.rawValue }
    @State private var selectedCategory: Int = 0
    
    private var filteredProducts: [CodableProductModel] {
        if selectedCategory >= 0 && selectedCategory < categories.count {
            let category = categories[selectedCategory]
            return mainPage.productModel.filter { $0.category?.rawValue == category }
        } else {
            return mainPage.productModel
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ScrollableListView()
                HStack {
                    ForEach(0..<categories.count, id: \.self) { selected in
                        CategoryView(isSelected: selected == selectedCategory, title: Categories.allCases[selected].displayName)
                            .onTapGesture {
                                selectedCategory = selected
                            }
                    }
                }
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(filteredProducts) { product in
                        NavigationLink {
                            ProductDetailView(image: product.image, title: product.title, product: product)
                        } label: {
                            ProductView(
                                productTitle: product.title,
                                productImage: product.image,
                                product: product
                            )
                            .frame(maxWidth: .infinity)
                            .safeAreaPadding()
                        }
                    }
                }
                .navigationDestination(for: CodableProductModel.self) { product in
                    ProductDetailView(image: product.image, title: product.title, product: product)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            .onAppear {
                shoppingBagViewModel.productsAddedToShoppingBag = shoppingBagProducts
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
        
        VStack(spacing: 0) {
            Spacer()
            let imageURL = URL(string: productImage)
            
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 80)
            } placeholder: {
                ProgressView()
            }
            
            Spacer()
            
            JustifiedText(text: productTitle)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.primary)
                .lineLimit(2)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(4)
            
            HStack {
                
                Text("\(product.formattedPrice) ლ")
                    .font(.system(size: 18))
                Spacer()
                
                VStack {
                    AddToShoppingBagButton(product: product, shoppingBagViewModel: _shoppingBagViewModel)
                }
                
            }
            .bold()
            .padding(10)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
        }
        .frame(width: 180, height: 230)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.primary, lineWidth: 1)
        )
    }
}


//private struct ProductViewOld: View {
//    var productTitle: String
//    var productImage: String
//    var product: CodableProductModel
//    @EnvironmentObject var shoppingBagViewModel: ShoppingBagViewModel
//
//    var body: some View {
//
//        ZStack {
//            VStack {
//                ZStack {
//                    let imageURL = URL(string: productImage)
//
//                    AsyncImage(url: imageURL) { image in
//                        image
//                            .resizable()
//                            .scaledToFit()
//                            .cornerRadius(20)
//                            .frame(width: 120, height: 150)
//                            .shadow(radius: 5)
//                    } placeholder: {
//                        ProgressView()
//                    }
//                    VStack {
//                        Spacer()
//                        HStack {
//                            JustifiedText(text: productTitle)
//                                .font(.system(size: 18))
//                            Spacer()
//                            VStack {
//                                //                                HeartButton(product: product, favouritesPageViewModel: _favouritesPageViewModel)
//                                AddToShoppingBagButton(product: product, shoppingBagViewModel: _shoppingBagViewModel)
//                            }
//                        }
//                        .bold()
//                        .padding(.leading, 4)
//                        .padding(.trailing, 4)
//                        .padding(.top, 8)
//                        .padding(.bottom, 8)
//                        .background(.ultraThinMaterial)
//                        .cornerRadius(20)
//                    }
//
//                }
//                VStack {
//                    HStack() {
//                        Text("ფასი: ")
//                            .bold()
//                        Text("\(product.formattedPrice) ლ")
//                        Spacer()
//                    }
//                    .multilineTextAlignment(.leading)
//                    .font(.system(size: 17))
//                    .padding(.leading, 2.5)
//                }
//                .padding(.leading, 2.5)
//                .padding(.trailing, 2.5)
//            }
//            .foregroundStyle(.black)
//            .frame(width: 175, height: 230)
//
//        }
//
//    }
//}

struct JustifiedText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct CategoryView: View {
    var isSelected: Bool = false
    var title: String = "All"
    
    var body: some View {
        VStack {
            Text(title)
                .font(Font.custom("EduAUVICWANTPre-Regular", size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ? Color.black : Color.gray)
            
            if isSelected {
                Rectangle()
                    .foregroundStyle(.black)
                    .frame(width: 5, height: 5)
                    .rotationEffect(Angle(degrees: 45))
            }
        }
    }
}
#Preview {
    MainPageView()
        .environmentObject(MainPageViewModel())
        .environmentObject(ShoppingBagViewModel())
}

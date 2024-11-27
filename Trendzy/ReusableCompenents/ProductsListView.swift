//
//  ProductsListView.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/27/24.
//

import SwiftUI


//struct ProductsListView: View {
//    var image: String
//    var title: String
////    var releaseDate: String
////    var language: String
////    var rating: String
//    var price: String
////    var genre: [String]
//    var codableProductModel: CodableProductModel?
//    @EnvironmentObject var shoppingBagViewModel: ShoppingBagViewModel
//    
//    var body: some View {
//        HStack {
//            ImageView(imageJPG: image)
//                .frame(width: screenWidth * 0.26, height: screenHeight * 0.18)
//                .cornerRadius(16)
//            
//            VStack(alignment: .leading , spacing: 4) {
//                
//                TitleView(title: title)
//                
//                Spacer()
//                
//                if let codableProductModel {
//                    AddToShoppingBagButton(product: codableProductModel, shoppingBagViewModel: _shoppingBagViewModel)
//                }
//                
//                Spacer()
//                
//                Group {
//                    
//                    ReleaseYearView(price: price)
//                }
//                .font(.system(size: Constants.horizontalSizeClass == .regular ? 24 : 12))
//            }
//            
//        }
//        .font(.system(size: 12))
//        .foregroundStyle(Color(.label))
//        .background(Color(.systemBackground))
//    }
//    
//    private struct TitleView: View {
//        var title: String
//        
//        var body: some View {
//            VStack {
//                Text(title)
//                    .multilineTextAlignment(.leading)
//                    .lineLimit(3)
//                    .bold()
//                    .font(.system(size: Constants.horizontalSizeClass == .regular ? 28 : 16))
//            }
//        }
//    }
//        
//    
//    private struct ReleaseYearView: View {
//        @Environment(\.colorScheme) var mode
//        var price: String
//        
//        var body: some View {
//            HStack {
//                Image(mode == .light ? "CalendarIcon" : "CalendarIcon-DarkMode")
//
//                Text(price)
////                Text(price.prefix(4))
//            }
//        }
//    }
//}


//#Preview {
//    ProductsListView()
//}

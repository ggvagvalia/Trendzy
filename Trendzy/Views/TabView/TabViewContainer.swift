//
//  TabViewContainer.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/8/24.
//

import SwiftUI

struct TabViewContainer: View {
//    var codableProduct: CodableProductModel

    var body: some View {
        TabView {
            MainPageView()
                .tabItem {
                        Image(systemName: "house")
                }
            NavigationStack {
                ShoppingBagView()
            }
                .tabItem {
                    Image(systemName: "cart")
                }
        }
        .background(
            VStack {
                Color.black.frame(height: 4)
                    .edgesIgnoringSafeArea(.top)
                Spacer()
            }
        )
        .accentColor(.black)
    }
}

#Preview {
    TabViewContainer()
        .environmentObject(MainPageViewModel())
        .environmentObject(ShoppingBagViewModel())
}

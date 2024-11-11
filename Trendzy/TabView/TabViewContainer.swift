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
            ShoppingBagView()
                .tabItem {
                    Image(systemName: "cart")
                }
        }
    }
}

#Preview {
    TabViewContainer()
        .environmentObject(MainPageViewModel())
        .environmentObject(ShoppingBagViewModel())
}

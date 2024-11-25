//
//  TrendzyApp.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/3/24.
//

import SwiftUI
import SwiftData

@main
struct TrendzyApp: App {
    
    @StateObject private var mainPageViewModel = MainPageViewModel()
    @StateObject private var shoppingBagViewModel = ShoppingBagViewModel()
//    @StateObject private var favouritesPageViewModel = FavouritesPageViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabViewContainer()
                .environmentObject(mainPageViewModel)
                .environmentObject(shoppingBagViewModel)
//                .environmentObject(favouritesPageViewModel)
        }
        .modelContainer(for: ShoppingBagModel.self)
//        .modelContainer(for: FavouritesPageModel.self)
    }
}

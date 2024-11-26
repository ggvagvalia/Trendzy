//
//  TrendzyApp.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/3/24.
//

import SwiftUI
import SwiftData
import Firebase

@main
struct TrendzyApp: App {
    
    @StateObject private var mainPageViewModel = ProductsListPageViewModel()
    @StateObject private var shoppingBagViewModel = ShoppingBagViewModel()
    @StateObject private var authenticationViewModel = AuthenticationViewModel()
    @StateObject private var favouritesPageViewModel = FavouritesPageViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            TabViewContainer()
                .environmentObject(mainPageViewModel)
                .environmentObject(shoppingBagViewModel)
                .environmentObject(authenticationViewModel)
                .environmentObject(favouritesPageViewModel)
        }
        .modelContainer(for: [ShoppingBagModel.self, FavouritesPageModel.self])
    }
}

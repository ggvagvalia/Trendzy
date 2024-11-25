//
//  TabViewContainer.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/8/24.
//

import SwiftUI

struct TabViewContainer: View {
    
    init() {
          let tabBarAppearance = UITabBarAppearance()
          tabBarAppearance.configureWithOpaqueBackground()
          tabBarAppearance.backgroundColor = .systemBackground

          UITabBar.appearance().standardAppearance = tabBarAppearance
          UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
      }
    
    var body: some View {
            TabView {
                NavigationStack {
                    
                    HomeView()
                }
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                ShoppingBag()
                    .tabItem {
                        Label("Shopping Bag", systemImage: "cart")
                    }
                FavouritesPage()
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
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

//#Preview {
//    TabViewContainer()
//        .environmentObject(MainPageViewModel())
//        .environmentObject(ShoppingBagViewModel())
//}

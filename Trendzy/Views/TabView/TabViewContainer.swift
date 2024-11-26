//
//  TabViewContainer.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/8/24.
//

import SwiftUI

struct TabViewContainer: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel

    init() {
          let tabBarAppearance = UITabBarAppearance()
          tabBarAppearance.configureWithOpaqueBackground()
          tabBarAppearance.backgroundColor = .systemBackground

          UITabBar.appearance().standardAppearance = tabBarAppearance
          UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
      }
    
    var body: some View {
//        Group {
            if viewModel.userSession != nil {
                
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
                    ProfilePage()
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
            } else {
                NavigationStack {
                    AuthenticationScreen()
//                        .safeAreaPadding()
                }
                .safeAreaPadding()
            }
//        }
    }
}

//#Preview {
//    TabViewContainer()
//        .environmentObject(MainPageViewModel())
//        .environmentObject(ShoppingBagViewModel())
//}

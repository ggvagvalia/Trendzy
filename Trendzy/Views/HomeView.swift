//
//  HomeView.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/14/24.
//

import SwiftUI

struct HomeView: View {
    
//    @State private var selectedCategory: Int = 0
//    @State private var showMainPage: Bool = false
    
    var body: some View {
            ZStack(alignment: .top) {
//                Color.black.edgesIgnoringSafeArea(.all)
                //            ZStack {
                VStack(spacing: 0) {
                    HeaderView()
                        .safeAreaPadding(.top, 50)
                    ScrollView(.vertical) {
                        VStack(spacing: 0) {
                            HeroImageView()

                            CategoriesView()
                                .safeAreaPadding()

//                            MainPageView()
//                                .id("MainPageView")
//                                .safeAreaPadding()
                            Spacer()
                        }
                        Spacer()
//                        .padding(.vertical)
                    }
//                    .background(.black)
                    .safeAreaPadding()
                }
                .edgesIgnoringSafeArea(.all)
//
            }
            .safeAreaPadding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct HeaderView: View {
    var body: some View {
        ZStack {
            Image("Zara-Logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
        }
    }
}

@ViewBuilder
private func HeroImageView() -> some View {
    ZStack {
        Image("Home_mm_OK")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity)
            .frame(height: 570)
//            .frame(height: screenhe)
        
        Button {
            print("Explore Collection")
        } label: {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.black.opacity(0.6)) // Updated background color
            
                .overlay {
                    Text("Explore Collection")
                        .font(Font.custom("EduAUVICWANTPre", size: 20))
                        .foregroundStyle(.white)
                }
            
        }
        .frame(width: 253, height: 40)
        .offset(y: 250)
        
    }
}

struct CategoriesView: View {

    var body: some View {
        NavigationLink(destination: MainPageView()) {
        VStack {

                Text("Go   to   Main  Page")
                    .font(Font.custom("EduAUVICWANTPre-Regular", size: 32))
                    .foregroundStyle(.white)
            
            //            Image("Divider1")
            //                .resizable()
            //                .aspectRatio(contentMode: .fill)
            //                .frame(width: 300, height: 40)
            //                .padding(.top, 5)
        }
        .frame(maxWidth: .infinity)
        .background(.black)
    }
    }
}

#Preview {
    HomeView()
        .environmentObject(MainPageViewModel())
        .environmentObject(ShoppingBagViewModel())
}

//
//  HomeView.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/14/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    HeaderView()
                    VStack(spacing: 0) {
                        HeroImageView()
                        CategoriesView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .safeAreaPadding()
            }
            .safeAreaPadding()
        }
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
            .frame(height: 600)
        
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
        NavigationLink(destination: ProductsListPage()) {
            VStack {
                Text("Go to Main Page")
                    .font(Font.custom("EduAUVICWANTPre-Regular", size: 32))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.black)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ProductsListPageViewModel())
        .environmentObject(ShoppingBagViewModel())
}

//
//  ScrollableListView.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/3/24.
//

import SwiftUI

struct ScrollableListView: View {
    let imageNames = ["Vans", "lacoste", "Gant", "Converse", "AtrioXruso", "Adidas"]
    @State private var currentImageIndex = 0
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            CarouselView(imageNames: imageNames, currentImageIndex: $currentImageIndex)
        }
        .frame(width: screenWidth / 1.05, height: screenHeight / 4)
        .onReceive(timer) { _ in
            withAnimation {
                currentImageIndex = (currentImageIndex + 1) % imageNames.count
            }
        }
    }
}

struct CarouselView: View {
    let imageNames: [String]
    @Binding var currentImageIndex: Int
    
    var body: some View {
        TabView(selection: $currentImageIndex) {
            ForEach(0..<imageNames.count, id: \.self) { index in
                Image(imageNames[index])
                    .resizable()
                    .scaledToFill()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .cornerRadius(20)
    }
}

struct ScrollableListView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableListView()
    }
}

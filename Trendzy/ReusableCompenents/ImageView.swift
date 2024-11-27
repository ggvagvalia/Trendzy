//
//  ImageView.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/27/24.
//

import SwiftUI

struct ImageView: View {
    let imageJPG: String
    
    var body: some View {
        if let imageURL = URL(string: "\(imageJPG)") {
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
        } else {
            Text("no image in URL")
        }
    }
}

//#Preview {
//    ImageView()
//}

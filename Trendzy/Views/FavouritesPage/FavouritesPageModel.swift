//
//  FavouritesPageModel.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/15/24.
//

import Foundation
import SwiftData

@Model
class FavouritesPageModel {
    var id: UUID = UUID()
    var productID: Int?
    var title: String
    var image: String
    var price: Double?
    
    var formattedPrice: String {
        String(format: "%.2f", price ?? 00)
    }
    
    init(id: Int?, title: String, image: String, price: Double) {
        self.productID = id
        self.title = title
        self.image = image
        self.price = price
    }
}

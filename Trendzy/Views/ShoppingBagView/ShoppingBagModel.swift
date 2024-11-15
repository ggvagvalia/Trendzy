//
//  ShoppingBagModel.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/8/24.
//

import Foundation
import SwiftData



@Model
class ShoppingBagModel {
    var id: UUID = UUID()
    var productID: Int?
    var title: String
    var image: String
    var price: Double?
    //   @Attribute var image: String
    
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

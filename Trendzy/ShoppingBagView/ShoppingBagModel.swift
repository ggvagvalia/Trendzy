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
    //   @Attribute var image: String
    
    init(id: Int?, title: String, image: String) {
        self.productID = id
        self.title = title
        self.image = image
    }
}

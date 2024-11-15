//
//  ProductModel.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/3/24.
//

import Foundation
import SwiftData

struct CodableProductModel: Decodable, Identifiable, Hashable {
    var id: Int?
    var title: String
    var image: String
    var price: Double?
    
    
    var formattedPrice: String {
        String(format: "%.2f", price ?? 00)
    }
}



struct ProductWithCartState: Identifiable {
    var id: UUID = UUID()
    
    var product: CodableProductModel
    var isInCart: Bool
}

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
    var category: Categories?
    
    var formattedPrice: String {
        String(format: "%.2f", price ?? 00)
    }
}

enum Categories: String, Decodable, CaseIterable {
    case MensClothing = "men's clothing"
    case WomensClothing = "women's clothing"
    case Jewelery = "jewelery"
    case Electronics = "electronics"
    
    var displayName: String {
        switch self {
        case .MensClothing:
            return "Men"
        case .WomensClothing:
            return "Women"
        case .Jewelery:
            return "Jewelry"
        case .Electronics:
            return "Electronics"
        }
    }
}

//
//enum GenderCategories: String {
//
//}


struct ProductWithCartState: Identifiable {
    var id: UUID = UUID()
    var product: CodableProductModel
    var isInCart: Bool
}

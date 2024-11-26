//
// ProductsListPageViewModel.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/3/24.
//

import Foundation
import NetworkingService
import SwiftData

class ProductsListPageViewModel: ObservableObject {
    
    @Published var productModel: [CodableProductModel] = []
//    @Published var productsAddedToCart: [ShoppingBagModel] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        NetworkService.shared.fetchData(urlString: "https://fakestoreapi.com/products") { [weak self] (result: Result<[CodableProductModel], any Error>) in
//            guard let self = self else { return }

            switch result {
            case .success(let success):
                self?.productModel = success
                print(success.count)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}

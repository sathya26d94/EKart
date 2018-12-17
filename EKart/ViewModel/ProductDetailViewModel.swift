//
//  ProductDetailViewModel.swift
//  EKart
//
//  Created by sathiyamoorthy N on 28/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import Foundation

protocol ProductDetailViewModelType {
    
    var product: Product {get}
    
    var name: String {get}
    
    var price: String {get}
    
    var imageURL: String {get}
    
    func addToCart()
    
}

class ProductDetailViewModel: ProductDetailViewModelType   {
    
    var imageURL: String
    
    var product: Product
    
    var name: String
    
    var price: String
    
    init(product: Product) {
        self.product = product
        name = self.product.name
        price = "MRP: " + String(self.product.price)
        imageURL = self.product.imageUrl
    }
    
    func addToCart() {
        CoreData.sharedManager.insertCart(product: product, quantity: 1)
    }
}

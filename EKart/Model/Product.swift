//
//  Product.swift
//  EKart
//
//  Created by sathiyamoorthy N on 18/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import Foundation

struct Product: Codable {
    var id: Int
    var name: String
    var imageUrl: String
    var categoryId: Int
    var price: String
    
    enum codingkeys: String, CodingKey {
        case imageUrl = "image_url"
        case categoryId = "category_id"
        case id
        case name
        case price
    }
    
    static func getProductList(from responseObject : [String: Any]) -> [Product]?{
        
        do {
            let responseJsonData = try JSONSerialization.data(withJSONObject: responseObject, options: .prettyPrinted)
            let decoder = JSONDecoder()
            let productList = try decoder.decode([Product].self, from: responseJsonData)
            print(productList)
            return productList
        }catch {
            print(error)
        }
        
        return nil
        
    }
    
}

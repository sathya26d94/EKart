//
//  Category.swift
//  EKart
//
//  Created by sathiyamoorthy N on 18/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import Foundation
struct Category: Codable {
    var id: Int
    var name: String
    var imageUrl: String
    
    enum codingkeys: String, CodingKey {
        case imageUrl = "image_url"
        case id
        case name
    
    }
    
    static func getCategoryList(from responseObject : [String: Any]) -> [Category]?{
        
        do {
            let responseJsonData = try JSONSerialization.data(withJSONObject: responseObject, options: .prettyPrinted)
            let decoder = JSONDecoder()
            let categoryList = try decoder.decode([Category].self, from: responseJsonData)
            print(categoryList)
            return categoryList
        }catch {
            print(error)
        }
        
        return nil
        
    }
    
}

//
//  Cart+CoreDataProperties.swift
//  EKart
//
//  Created by sathiyamoorthy N on 29/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int16
    @NSManaged public var categoryId: Int16
    @NSManaged public var price: Double
    @NSManaged public var quantity: Int16
    @NSManaged public var imageUrl: String?

}

//
//  CoreData.swift
//  EKart
//
//  Created by sathiyamoorthy N on 29/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import Foundation
import Foundation
import CoreData
import UIKit

class CoreData {
    
    static let sharedManager = CoreData()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "EKart")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = CoreData.sharedManager.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    /*Insert*/
    func insertCart(product: Product, quantity : Int16) {
        
        if let list = fetchCartList()  {
            let outputfiler = list.filter({
                $0.id == product.id && $0.categoryId == Int16(product.categoryId)
            })
            
            if let oldCart = outputfiler.first {
                update(quantity: oldCart.quantity + 1, cart: oldCart)
                return
            }
        }
        
        let managedContext = CoreData.sharedManager.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Cart", in: managedContext)!
        let cart = NSManagedObject(entity: entity, insertInto: managedContext) as? Cart
        
        cart?.categoryId = Int16(product.categoryId)
        cart?.quantity = quantity
        cart?.name = product.name
        cart?.price = Double(product.price)
        cart?.id = Int16(product.id)
        cart?.imageUrl = product.imageUrl
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            
        }
    }
    
    func update(quantity : Int16, cart : Cart) {
        
        let context = CoreData.sharedManager.persistentContainer.viewContext
        
        do {
            cart.quantity = quantity
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
            
        } catch {
            print("Error with request: \(error)")
        }
    }
    
    /*delete*/
    func delete(cart : Cart){
        
        let managedContext = CoreData.sharedManager.persistentContainer.viewContext
        
        do {
            managedContext.delete(cart)
            
        } catch {
            print(error)
        }
        
        do {
            try managedContext.save()
        } catch {
            
        }
    }
    
    func fetchCartList() -> [Cart]?{
        
        let managedContext = CoreData.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Cart")
        
        do {
            let cartList = try managedContext.fetch(fetchRequest)
            return cartList as? [Cart]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    
}



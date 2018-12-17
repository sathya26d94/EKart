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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
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
        
        let entity = NSEntityDescription.entity(forEntityName: "Cart",
                                                in: managedContext)!
        let cart = NSManagedObject(entity: entity,
                                   insertInto: managedContext) as? Cart
        
        cart?.categoryId = Int16(product.categoryId)
        cart?.quantity = quantity
        cart?.name = product.name
        cart?.price = Double(product.price)
        cart?.id = Int16(product.id)
        cart?.imageUrl = product.imageUrl
        
        /*
         You commit your changes to person and save to disk by calling save on the managed object context. Note save can throw an error, which is why you call it using the try keyword within a do-catch block. Finally, insert the new managed object into the people array so it shows up when the table view reloads.
         */
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            
        }
    }
    
    func update(quantity : Int16, cart : Cart) {
        
        /*1.
         Before you can save or retrieve anything from your Core Data store, you first need to get your hands on an NSManagedObjectContext. You can consider a managed object context as an in-memory “scratchpad” for working with managed objects.
         Think of saving a new managed object to Core Data as a two-step process: first, you insert a new managed object into a managed object context; then, after you’re happy with your shiny new managed object, you “commit” the changes in your managed object context to save it to disk.
         Xcode has already generated a managed object context as part of the new project’s template. Remember, this only happens if you check the Use Core Data checkbox at the beginning. This default managed object context lives as a property of the NSPersistentContainer in the application delegate. To access it, you first get a reference to the app delegate.
         */
        let context = CoreData.sharedManager.persistentContainer.viewContext
        
        do {
            
            
            /*
             With an NSManagedObject in hand, you set the name attribute using key-value coding. You must spell the KVC key (name in this case) exactly as it appears in your Data Model
             */
            cart.quantity = quantity
            
            
            /*
             You commit your changes to person and save to disk by calling save on the managed object context. Note save can throw an error, which is why you call it using the try keyword within a do-catch block. Finally, insert the new managed object into the people array so it shows up when the table view reloads.
             */
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
            // Do something in response to error condition
            print(error)
        }
        
        do {
            try managedContext.save()
        } catch {
            // Do something in response to error condition
        }
    }
    
    func fetchCartList() -> [Cart]?{
        
        
        /*Before you can do anything with Core Data, you need a managed object context. */
        let managedContext = CoreData.sharedManager.persistentContainer.viewContext
        
        /*As the name suggests, NSFetchRequest is the class responsible for fetching from Core Data.
         
         Initializing a fetch request with init(entityName:), fetches all objects of a particular entity. This is what you do here to fetch all Person entities.
         */
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Cart")
        
        /*You hand the fetch request over to the managed object context to do the heavy lifting. fetch(_:) returns an array of managed objects meeting the criteria specified by the fetch request.*/
        do {
            let cartList = try managedContext.fetch(fetchRequest)
            return cartList as? [Cart]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    
}


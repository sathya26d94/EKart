//
//  CartViewModel.swift
//  EKart
//
//  Created by sathiyamoorthy N on 19/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import Foundation
import UIKit

protocol CartDelagate {
    func cartListDidChanged()
}

protocol CartViewModelType {
    var cartList: [Cart] {get}
    
    var delegate: CartDelagate? {get set }
    
    var totalAmount: Double{get }
    
    var displayTotalAmount: String{get }
    
    func fetchCartList()
    
    func deleteItem(atIndex: Int)
}

class CartViewModel: CartViewModelType   {
    
    var displayTotalAmount: String = "Total : 0"
    
    var totalAmount: Double = 0 {
        didSet {
            if cartList.count == 0 {
                displayTotalAmount = "No Items in the Cart"
            }else {
                displayTotalAmount = "Total : \(totalAmount)"
            }
            
        }
    }
    
    var delegate: CartDelagate?
    
    var cartList : [Cart] = [] {
        didSet{
            setTotal()
            delegate?.cartListDidChanged()
        }
    }
    
    init() {
        
    }
    
    func fetchCartList() {
        cartList = CoreData.sharedManager.fetchCartList() ?? []
        
    }
    
    func deleteItem(atIndex: Int) {
        if atIndex < cartList.count {
            CoreData.sharedManager.delete(cart: cartList[atIndex])
            cartList.remove(at: atIndex)
        }
    }
    
    func updateQuantity(atIndex: Int, quantity: Int) {
        CoreData.sharedManager.update(quantity: Int16(quantity), cart: cartList[atIndex])
        cartList[atIndex].quantity = Int16(quantity)
        setTotal()
        delegate?.cartListDidChanged()
    }
    
    private func setTotal() {
        totalAmount = cartList.map({($0.price) * Double($0.quantity)}).reduce(0, +)

    }
}

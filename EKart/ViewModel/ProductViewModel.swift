//
//  ProductViewModel.swift
//  EKart
//
//  Created by sathiyamoorthy N on 19/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import Foundation

protocol ProductDelagate {
    func productListDidChanged()
}

protocol ProductViewModelType {
    var productList: [Product] {get}
    
    var delegate: ProductDelagate? {get set }
    
    var category: Category {get }
    
    func fetchProducts()
}

class ProductViewModel: ProductViewModelType   {
    var category: Category {
        didSet {
            title = category.name
            fetchProducts()
        }
    }
    
    var delegate: ProductDelagate?
    
    var productList : [Product] = [] {
        didSet{
            delegate?.productListDidChanged()
        }
    }
    
    var title: String?
    
    init(category: Category) {
        self.category = category
        title = self.category.name
        fetchProducts()
    }
    
    func fetchProducts() {
        if category.id == 1 {
            let product1 = Product.init(id: 11, name: "Microwave oven", imageUrl: "https://us.123rf.com/450wm/mrhighsky/mrhighsky1704/mrhighsky170400001/75824102-cartoon-style-drawing-of-a-microwave-oven.jpg?ver=6", categoryId: 1, price: 4000)
            let product2 = Product.init(id: 12, name: "Television", imageUrl: "https://masonbm.files.wordpress.com/2013/10/shutterstock_15096583.jpg", categoryId: 1, price: 5000)
            let product3 = Product.init(id: 13, name: "Vacuum Cleaner", imageUrl: "https://png.pngtree.com/element_origin_min_pic/16/12/21/cc7d57c797f2c9a1788878a9fd693652.jpg", categoryId: 1, price: 5000)
            
            productList = [product1, product2, product3]
        }
        
        if category.id == 2 {
            let product4 = Product.init(id: 23, name: "Table", imageUrl: "https://www.royaloakindia.com/uploads/ROYIND-royaloak-petal-office-table-maple2.jpg", categoryId: 2, price: 5000)
            let product5 = Product.init(id: 24, name: "Chair", imageUrl: "https://images.crateandbarrel.com/is/image/Crate/GiaChairTealSHF15_16x9/$web_zoom_furn_hero$/150617162036/gia-chair.jpg", categoryId: 2, price: 5000)
            let product6 = Product.init(id: 25, name: "Almirah", imageUrl: "https://5.imimg.com/data5/HW/AG/MY-18226454/burma-teak-wooden-almirah-500x500.jpg", categoryId: 2, price: 5000)
            
            productList = [product4, product5, product6]
        }
        
    }
    
    
}

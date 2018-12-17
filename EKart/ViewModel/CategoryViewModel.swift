//
//  CategoryViewModel.swift
//  EKart
//
//  Created by sathiyamoorthy N on 19/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import Foundation

protocol CategoryDelagate {
    func categoriesListDidChanged()
}

protocol CategoryViewModelType {
    var categoriesList: [Category] {get}
    
    var delegate: CategoryDelagate? {get set }
    
    func fetchCategoires()
}

class CategoryViewModel: CategoryViewModelType   {
    var delegate: CategoryDelagate?
    
    var categoriesList : [Category] = [] {//0 results by default
        didSet{
            delegate?.categoriesListDidChanged() //notify
        }
    }
    
    init() {
        
    }
    
    func fetchCategoires() {
        let category1 = Category.init(id: 1, name: "Electronics", imageUrl: "https://previews.123rf.com/images/beawolf/beawolf1509/beawolf150900012/46183724-very-high-resolution-rendering-of-an-electronic-circuit.jpg")
        let category2 = Category.init(id: 2, name: "Furniture", imageUrl: "https://cdn.vox-cdn.com/thumbor/MLk3bbeVC-3Y5Z8XUz-pMtiC7vs=/0x0:3000x2220/1820x1213/filters:focal(1260x870:1740x1350)/cdn.vox-cdn.com/uploads/chorus_image/image/59630809/House_Calls_Portland_Nathan_Papazian_living.0.jpg")
        
        categoriesList = [category1, category2]
    }
 
    
}

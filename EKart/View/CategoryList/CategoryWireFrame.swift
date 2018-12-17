//
//  CategoryWireFrame.swift
//  EKart
//
//  Created by sathiyamoorthy N on 19/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import Foundation
import UIKit

class CategoryWireFrame {
    var productListViewController: ProductListViewController?
    
    func presentProductsInterface(fromController: UIViewController, category: Category){
        
        productListViewController = ProductListViewController()
        productListViewController?.productViewModel = ProductViewModel.init(category: category)
        fromController.navigationController?.pushViewController(productListViewController!, animated: true)
        
    }
}

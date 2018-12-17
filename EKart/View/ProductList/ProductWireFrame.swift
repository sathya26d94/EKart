//
//  ProductWireFrame.swift
//  EKart
//
//  Created by sathiyamoorthy N on 19/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import UIKit
class ProductWireFrame {
    var productDetailViewController: ProductDetailViewController?
    
    func presentProductDetailInterface(fromController: UIViewController, product: Product) {
        productDetailViewController = ProductDetailViewController()
        productDetailViewController?.productDetailViewModel = ProductDetailViewModel.init(product: product)
        fromController.navigationController?.pushViewController(productDetailViewController!, animated: true)
    }
}

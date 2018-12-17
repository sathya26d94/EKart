//
//  ProductDetailViewController.swift
//  EKart
//
//  Created by sathiyamoorthy N on 28/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var cartButton: UIButton!
    
    var productDetailViewModel: ProductDetailViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderUI()
    }
    
    func renderUI() {
        guard let productDetailViewModel = self.productDetailViewModel else {
            return
        }
        name.text = productDetailViewModel.name
        price.text = productDetailViewModel.price
        productImageView.cacheImage(urlString: productDetailViewModel.imageURL)
    }

    @IBAction func cartButtonTouched(_ sender: Any) {
        productDetailViewModel.addToCart()
    }
}

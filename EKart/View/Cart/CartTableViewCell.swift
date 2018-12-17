//
//  CartTableViewCell.swift
//  EKart
//
//  Created by sathiyamoorthy N on 05/12/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var cartData: Cart?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupView() {
        itemImageView.cacheImage(urlString: cartData?.imageUrl ?? "")
        itemNameLabel.text = cartData?.name
        
        if let quantity = cartData?.quantity {
            quantityLabel.text = "Qty: " + String(describing: quantity)
            priceLabel.text = String((cartData?.price ?? 0) * Double(quantity))
        }
        
    }
    
}

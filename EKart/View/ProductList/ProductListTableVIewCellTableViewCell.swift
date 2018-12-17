//
//  ProductListTableVIewCellTableViewCell.swift
//  EKart
//
//  Created by sathiyamoorthy N on 24/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import UIKit

class ProductListTableVIewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  CartTotalTableViewCell.swift
//  EKart
//
//  Created by sathiyamoorthy N on 07/12/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import UIKit

class CartTotalTableViewCell: UITableViewCell {

    @IBOutlet weak var labelHorizontalConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var totalAmountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(isCartCount : Int) {
        if isCartCount == 0 {
            payButton.isHidden = true
            labelHorizontalConstraint.priority = UILayoutPriority(999.0)
            labelTrailingConstraint.priority = UILayoutPriority(1.0)
            totalAmountLabel.textAlignment = .center
        }else {
            payButton.isHidden = false
            labelHorizontalConstraint.priority = UILayoutPriority(1.0)
            labelTrailingConstraint.priority = UILayoutPriority(999.0)
            totalAmountLabel.textAlignment = .right
        }
    }
    
    @IBAction func proceedToPayTouched(_ sender: Any) {
        
    }
    
}

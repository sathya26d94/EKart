//
//  CartViewController.swift
//  EKart
//
//  Created by sathiyamoorthy N on 05/12/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var textField: UITextField?
    
    let CartCellReuseId = "CartCellReuseId"
    
    let cartViewModel: CartViewModel = CartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Cart"
        cartViewModel.delegate = self
        cartViewModel.fetchCartList()
    }
    
}

// MARK: UITableViewDataSource, UITableViewDelegate

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView(){
        tableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: CartCellReuseId)
        tableView.register(UINib(nibName: "CartTotalTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTotalTableViewCell")
        tableView.separatorColor = UIColor.black
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartViewModel.cartList.count + 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == cartViewModel.cartList.count {
            let cell: CartTotalTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CartTotalTableViewCell", for: indexPath) as! CartTotalTableViewCell
            cell.totalAmountLabel.text = cartViewModel.displayTotalAmount
            cell.setupView(isCartCount: cartViewModel.cartList.count)
            
            return cell
        }
        
        let cell: CartTableViewCell = tableView.dequeueReusableCell(withIdentifier: CartCellReuseId, for: indexPath) as! CartTableViewCell
        cell.cartData = cartViewModel.cartList[indexPath.row]
        cell.setupView()
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row < cartViewModel.cartList.count {
            return true
        }
        
        return false
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            cartViewModel.deleteItem(atIndex: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        showQuantityEditBox(index: indexPath.row)
    }
    
}

extension CartViewController : CartDelagate {
    
    func cartListDidChanged() {
        tableView.reloadData()
    }
    
}

// Mark : Quantity Alert Box

extension CartViewController{
    
    func showQuantityEditBox(index: Int) {

        if cartViewModel.cartList.count > index {
            let alert = UIAlertController(title: "Enter Quantity", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alert.addTextField(configurationHandler: configurationTextField)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:{ (UIAlertAction) in
                self.cartViewModel.updateQuantity(atIndex: index, quantity: Int(self.textField?.text ?? "1") ?? 1)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func configurationTextField(textField: UITextField!) {
        if (textField) != nil {
            self.textField = textField!
            self.textField?.keyboardType = .numberPad
        }
    }
    
}

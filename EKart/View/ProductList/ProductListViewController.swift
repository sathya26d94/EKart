//
//  ProductListViewController.swift
//  EKart
//
//  Created by sathiyamoorthy N on 19/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    let productListCellReuseId = "ProductCellReuseId"
    
    var productViewModel: ProductViewModel!
    
    lazy var wireFrame: ProductWireFrame = {
        return ProductWireFrame()
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: productListCellReuseId)
        tableview.register(UINib(nibName: "ProductListTableVIewCellTableViewCell", bundle: nil), forCellReuseIdentifier: productListCellReuseId)
        
        tableview.separatorColor = UIColor.black
        tableview.separatorStyle = .none
        tableview.backgroundColor = .clear
        tableview.reloadData()

        productViewModel.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        definesPresentationContext = true
        title = productViewModel.title
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        
    }
    
}

// MARK: UITableViewDataSource

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewModel.productList.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ProductListTableVIewCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: productListCellReuseId, for: indexPath) as! ProductListTableVIewCellTableViewCell
        
        let product = productViewModel.productList[indexPath.row]
        
        cell.nameLabel.text = product.name
        cell.priceLabel.text = String(product.price)
        cell.productImageView.cacheImage(urlString: product.imageUrl)
        cell.tag = product.id
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let product = productViewModel.productList[indexPath.row]
        wireFrame.presentProductDetailInterface(fromController: self, product: product)
        
    }
    
}

extension ProductListViewController : ProductDelagate {
    func productListDidChanged() {
        tableview.reloadData()
    }
    
}

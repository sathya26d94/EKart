//
//  CategoryViewController.swift
//  EKart
//
//  Created by sathiyamoorthy N on 18/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let CategoryCellReuseId = "CategoryCellReuseId"
    
    let categoryViewModel: CategoryViewModel = CategoryViewModel()

    lazy var wireFrame: CategoryWireFrame = {
       return CategoryWireFrame()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: CategoryCellReuseId)
        tableView.separatorColor = UIColor.black
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Categories"
        categoryViewModel.delegate = self
        categoryViewModel.fetchCategoires()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: UITableViewDataSource

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryViewModel.categoriesList.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CategoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: CategoryCellReuseId, for: indexPath) as! CategoryTableViewCell
        
        let category = categoryViewModel.categoriesList[indexPath.row]
        
        cell.titleLabel.text = category.name
        cell.categoryImageView.cacheImage(urlString: category.imageUrl)
        cell.tag = category.id
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let category = categoryViewModel.categoriesList[indexPath.row]
        wireFrame.presentProductsInterface(fromController: self, category: category)
        
    }
    
}

extension CategoryViewController : CategoryDelagate {
    func categoriesListDidChanged() {
        tableView.reloadData()
    }
    
}

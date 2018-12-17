//
//  TabBarViewController.swift
//  EKart
//
//  Created by sathiyamoorthy N on 17/11/18.
//  Copyright © 2018 sathiyamoorthy N. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let categoryViewController = CategoryViewController()
        categoryViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        let categoryNVC = UINavigationController.init(rootViewController: categoryViewController)
        
        let cartViewController = CartViewController()
        cartViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let cartNVC = UINavigationController.init(rootViewController: cartViewController)
        
        viewControllers = [categoryNVC, cartNVC]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

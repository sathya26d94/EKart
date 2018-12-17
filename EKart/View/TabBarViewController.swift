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

        let firstViewController = UIViewController()
        
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        
        let secondViewController = UIViewController()
        
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        let tabBarList = [firstViewController, secondViewController]
        
        viewControllers = tabBarList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

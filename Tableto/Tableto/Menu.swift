//
//  menu.swift
//  Tableto
//
//  Created by Ishan Gupta on 3/19/17.
//  Copyright © 2017 Mher Torjyan. All rights reserved.
//

import UIKit



class Menu: UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        //   let layout = UICollectionViewFlowLayout()
        
        let layout = PostLoginViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let navigationController =  UINavigationController(rootViewController: layout)
        //  window?.rootViewController = UINavigationController(rootViewController: PostLoginViewController(collectionViewLayout: layout))
        
        
        
        navigationController.title = "Search"
        
        navigationController.tabBarItem.image = UIImage(named: "search")
        
        
        // second item at tab bar
        let profile = LoginController()    // change to the respective class
        let secondNavigationController = UINavigationController(rootViewController: profile)
        secondNavigationController.title = "Profile"
        secondNavigationController.tabBarItem.image = UIImage(named: "profile")
        
        // thired item at tab bar
        
        let cart = CartViewController()
        let thirdNavigationController = UINavigationController(rootViewController: cart)
        thirdNavigationController.title = "Cart"
        thirdNavigationController.tabBarItem.image = UIImage(named: "cart")
        
        viewControllers = [navigationController, secondNavigationController, thirdNavigationController]
        
        
        
        
        
        
    }
    
    
}

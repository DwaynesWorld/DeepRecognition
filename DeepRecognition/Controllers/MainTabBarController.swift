//
//  MainTabBarController.swift
//  FireGram
//
//  Created by Kyle Thompson on 01/30/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = UINavigationController(rootViewController: HomeViewController())
        home.tabBarItem.title = "Home"
        
        self.modalPresentationStyle = .fullScreen
        self.viewControllers = [home]
        self.selectedViewController = home
    }
}

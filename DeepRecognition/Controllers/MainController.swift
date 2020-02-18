//
//  MainController.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/10/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class MainController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeController = UINavigationController(rootViewController: HomeViewController())
        homeController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        homeController.navigationBar.shadowImage = UIImage()
        homeController.navigationBar.isTranslucent = true
        homeController.navigationBar.backgroundColor = .clear
        homeController.tabBarItem.title = "Home"
        homeController.tabBarItem.image = UIImage(icon:.ionicons(.home), size: CGSize(width: 30, height: 30))

        let v1 = TestViewController()
        v1.tabBarItem.title = "Activity"
        v1.tabBarItem.image = UIImage(icon: .ionicons(.arrowGraphUpRight), size: CGSize(width: 30, height: 30))
        
        let v2 = BaseViewController()
        v2.tabBarItem.title = "History"
        v2.tabBarItem.image = UIImage(icon: .ionicons(.clock), size: CGSize(width: 30, height: 30))
        
        let settingsController = SettingsPlaceholderViewController()
        settingsController.tabBarItem.title = "Settings"
        settingsController.tabBarItem.image = UIImage(icon: .ionicons(.gearA), size: CGSize(width: 30, height: 30))
        
        viewControllers = [homeController, v1, v2, settingsController]
        selectedViewController = homeController
        tabBar.barTintColor = .white
        tabBar.tintColor = .rgb(196, 73, 76)
        tabBar.unselectedItemTintColor = .rgb(30, 46, 52)
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

class SettingsPlaceholderViewController: UIViewController {}

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
        
        let homeController = HomeViewController()
        homeController.tabBarItem.title = "Home"
        homeController.tabBarItem.image = UIImage(icon:.ionicons(.home), size: CGSize(width: 30, height: 30))

        let v1 = BaseViewController()
        v1.tabBarItem.title = "Activity"
        v1.tabBarItem.image = UIImage(icon: .ionicons(.arrowGraphUpRight), size: CGSize(width: 30, height: 30))
        
        let v2 = BaseViewController()
        v2.tabBarItem.title = "History"
        v2.tabBarItem.image = UIImage(icon: .ionicons(.clock), size: CGSize(width: 30, height: 30))
        
        let settingsController = SettingsViewController()
        settingsController.tabBarItem.title = "Settings"
        settingsController.tabBarItem.image = UIImage(icon: .ionicons(.gearA), size: CGSize(width: 30, height: 30))
        
        self.viewControllers = [homeController, v1, v2, settingsController]
        self.selectedViewController = homeController
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .rgb(196, 73, 76)
        self.tabBar.unselectedItemTintColor = .rgb(30, 46, 52)
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

class SettingsViewController: UIViewController {}

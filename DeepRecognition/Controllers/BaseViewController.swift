//
//  BaseViewController.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/16/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    let authenticationService = AppDelegate.container.resolve(AuthenticationServiceProtocol.self)!
    
    lazy var settingsViewController: SettingsViewController = {
        let controller = SettingsViewController()
        controller.currentController = self
        return controller
    }()

    override func viewDidLoad() {
        if let delegate = UIApplication.shared.delegate {
            self.tabBarController?.delegate = delegate as? UITabBarControllerDelegate
        }
    }
    
    func handleSelection(forSetting setting: Setting) {
        switch setting.name {
        case SettingName.logout:
            self.authenticationService.signOut { [unowned self] in
                let login = LoginViewController()
                login.modalPresentationStyle = .fullScreen
                self.view.window?.rootViewController = login
            }
        default:
            let dummyViewController = UIViewController()
            dummyViewController.view.backgroundColor = .lightGray
            present(dummyViewController, animated: true, completion: nil)
        }
    }
}

//
//  HomeViewController.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    private let userService = AppDelegate.container.resolve(UserServiceProtocol.self)!
    private let departmentService = AppDelegate.container.resolve(DepartmentServiceProtocol.self)!
    
    private var currentUser: UserProfile?
    private var departments = [Department]()
    
    unowned var homeView: HomeView { self.view as! HomeView }
    unowned var greetingLabel: UILabel { homeView.greetingLabel }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUserInfo()
        loadDepartments()
    }
    
    
    public override func loadView() {
        view = HomeView()
    }
    
    func loadUserInfo() {
        self.userService.getCurrentUser { result in
            if let profile = result.data {
                self.currentUser = profile
                
                if let firstName = profile.user.firstName {
                    self.greetingLabel.text = "Hello, \(firstName)"
                }
            } else {
                // show oops.
                print(result.error ?? "The operation couldn’t be completed.")
            }
        }
    }
    
    func loadDepartments() {
        self.departmentService.getDepartments { result in
            if let data = result.data {
                self.departments = data.results
                for d in self.departments {
                    print(d.name!)
                }
            } else {
                // show oops.
                print(result.error ?? "The operation couldn’t be completed.")
            }
        }
    }
}

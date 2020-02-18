//
//  EmployeeListViewController.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/18/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

class EmployeeListViewController: BaseViewController {
    
    public var isLoading = true {
        didSet {
            
        }
    }
    
    unowned var employeeListView: EmployeeListView { self.view as! EmployeeListView }
    unowned var loadingView: AnimationView { employeeListView.loadingView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    public override func loadView() {
        view = EmployeeListView()
    }
}

//
//  HomeViewController.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit
import Lottie

class HomeViewController: BaseViewController {
    private let userService = AppDelegate.container.resolve(UserServiceProtocol.self)!
    private let teamService = AppDelegate.container.resolve(TeamServiceProtocol.self)!
    
    private var currentUser: UserProfile?
    private var isSearching: Bool = false
    
    unowned var homeView: HomeView { self.view as! HomeView }
    unowned var greetingLabel: UILabel { homeView.greetingLabel }
    unowned var searchView: SearchView { homeView.searchView }
    unowned var employeeSection: EmployeesView { homeView.employeeSection }
    unowned var teamSection: TeamsView { homeView.teamSection }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActions()
        loadUserInfo()
        loadTeams()
    }
    
    public override func loadView() {
        view = HomeView()
    }
    
    func setupActions() {
        searchView.searchButton.addTarget(self, action: #selector(HomeViewController.handleSearch), for: .touchUpInside)
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(HomeViewController.dismissSearchResults))
        swipe.direction = .down
        employeeSection.slideIndicator.addGestureRecognizer(swipe)
    }
    
    func loadUserInfo() {
        guard let email = Session.shared.currentUserEmail else {
            return
        }
        
        userService.getUser(fromEmail: email) { [unowned self] result in
            if let profile = result.data {
                self.currentUser = profile
                
                if let firstName = profile.firstName {
                    self.greetingLabel.text = "Hello, \(firstName)"
                }
            } else {
                // show oops.
                print(result.error ?? "The operation couldn’t be completed.")
            }
        }
    }
    
    func loadTeams() {
        teamService.getTeams { [unowned self] result in
            if let teams = result.data {
                self.teamSection.teams = teams.filter { $0.employeeCount > 0 }
            } else {
                print(result.error ?? "The operation couldn’t be completed.")
            }
        }
    }
    
    @objc func handleSearch() {
        guard !isSearching else { return }
        
        isSearching = true
        teamSection.isHidden = true
        employeeSection.isHidden = false
        employeeSection.showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            self.employeeSection.showEmployees([self.currentUser!, self.currentUser!])
            self.isSearching = false
        }
    }
    
    @objc func dismissSearchResults() {
        print("dismissing")
    }
    
    deinit {
        print("Releasing")
    }
}

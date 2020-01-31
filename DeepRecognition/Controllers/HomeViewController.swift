//
//  HomeViewController.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit
import OAuth2

class HomeViewController: UIViewController {
    
    let loader = OAuth2DataLoader(oauth2: Authentication.shared.oauth2)
    
    unowned var homeView: HomeView { self.view as! HomeView }
    unowned var homeLabel: UILabel { homeView.homeLabel }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserInfo()
    }
    
    public override func loadView() {
        self.view = HomeView()
    }
    
    func loadUserInfo() {
        let oauth2 = Authentication.shared.oauth2
        let baseUrl = URL(string: "https://app.7geese.com:443/api/v/2.0/")!
        let url = baseUrl.appendingPathComponent("userprofiles")
        let request = oauth2.request(forURL: url)
        
        loader.perform(request: request) { response in
            if let data = response.data {
                let decoder = JSONDecoder()
                let userProfiles = try? decoder.decode([UserProfile].self, from: data)
                if let profiles = userProfiles {
                    DispatchQueue.main.async {
                        print(profiles)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    print("error occurred")
                }
            }
        }
    }
    
}

//
//  HomeViewController.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    unowned var homeView: HomeView { self.view as! HomeView }
    unowned var homeLabel: UILabel { homeView.homeLabel }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = .fullScreen
        
        loadUserInfo()
    }
    
    public override func loadView() {
        view = HomeView()
    }
    
    func loadUserInfo() {
//        guard let oauth2 = Authentication.shared.oauth2 else { fatalError() }
//        
//        let baseUrl = URL(string: "https://app.7geese.com:443/api/v/2.0/")!
//        let url = baseUrl.appendingPathComponent("userprofiles")
//        
//        print(oauth2.accessToken ?? "none")
//        
//        let request = oauth2.request(forURL: url)
//        let loader = OAuth2DataLoader(oauth2: oauth2)
//        
//        loader.perform(request: request) { response in
//            if let data = response.data {
//                let decoder = JSONDecoder()
//                let userProfiles = try? decoder.decode([UserProfile].self, from: data)
//                if let profiles = userProfiles {
//                    DispatchQueue.main.async {
//                        print(profiles)
//                    }
//                }
//            } else {
//                DispatchQueue.main.async {
//                    print("error occurred")
//                }
//            }
//        }
    }
    
}

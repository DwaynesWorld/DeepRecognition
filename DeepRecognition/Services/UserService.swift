//
//  UserService.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/12/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Alamofire

class UserService: UserServiceProtocol {
    func getCurrentUser(handler: @escaping ((data: UserProfile?, error: RequestError?)) -> Void) {
        guard let token = Session.shared.current?.accessToken else {
            handler((nil, RequestError.invalidSession))
            return
        }
        
        let url = "\(AppSettings.baseUrl)/api/v/2.0/userprofiles/me/"
        let headers: HTTPHeaders = [ .authorization(bearerToken: token)]
        
        AF.request(url, method: .get, headers: headers).response { response in
            switch (response.result) {
            case .success(let data):
                do {
                    let profile = try JSONDecoder().decode(UserProfile.self, from: data!)
                    handler((profile, nil))
                } catch {
                    handler((nil, RequestError.unexpectedResponse(error: error.localizedDescription)))
                }
            case .failure(let error):
                handler((nil, RequestError.invalidRequest(error: error.failureReason ?? "An unexpected error has occurred.")))
            }
        }
    }
    
    func getUser () {
        
    }
    
    func getUsers() {
        
    }
}

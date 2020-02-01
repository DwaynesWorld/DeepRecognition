//
//  Authentication.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Alamofire

fileprivate let tokenUrl = "https://app.7geese.com/o/token/"
fileprivate let clientId: String = "xebVxA8Syn5C9fRAL4ySdwnMhAsCgGIlaBnNAnfO"
fileprivate let clientSecret: String = "VPpnoVE4aBOXHGXvPKiiq9gbUoNRQqxKIcHEM8Oi5ghhUqt0F26EMcoRmuOVMMSjTwhZsPZlK5G78MPk7SXPMj6nGWApBEJXRne5DzQaIRjwXqMcxc13IplppzkqYFSN"
fileprivate let scope: String  = "all"

class Authentication {
    var current: AuthState?
    
    static let shared = Authentication()
    private init() {}
    
    func signIn(withUsername username: String, password: String, handler:@escaping (_ success: Bool)-> Void) {
        
        let parameters = [
            "grant_type": "password",
            "username": username,
            "password": password,
            "scope": "all"
        ]
        
        let headers: HTTPHeaders = [
            .authorization(username: clientId, password: clientSecret)
        ]
        
        AF.request(tokenUrl, method: .post, parameters: parameters, headers: headers)
            .response { response in
                if let data = response.data {
                    if let result = try? JSONDecoder().decode(AuthState.self, from: data) {
                        self.current = result
                        handler(true)
                    }
                }
            
                handler(false)
        }
    }
}

//
//  Authentication.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

fileprivate let tokenUrl = "https://app.7geese.com/o/token/"
fileprivate let clientId: String = "xebVxA8Syn5C9fRAL4ySdwnMhAsCgGIlaBnNAnfO"
fileprivate let clientSecret: String = "VPpnoVE4aBOXHGXvPKiiq9gbUoNRQqxKIcHEM8Oi5ghhUqt0F26EMcoRmuOVMMSjTwhZsPZlK5G78MPk7SXPMj6nGWApBEJXRne5DzQaIRjwXqMcxc13IplppzkqYFSN"
fileprivate let scope: String  = "all"

class AuthService {
    private var current: AuthState?
    
    @discardableResult
    public func persistSession(_ session: AuthState) -> Bool {
        self.current = session

        guard let data = try? JSONEncoder().encode(session) else {
            return false
        }
        
        let interval = TimeInterval(session.expiresIn)
        let expiration = Date().addingTimeInterval(interval).timeIntervalSince1970
        
        KeychainWrapper.standard.set(expiration, forKey: ".auth.expiration")
        KeychainWrapper.standard.set(data, forKey: ".auth")
        
        return true
    }
    
    public func checkSession() -> Bool {
        guard let data = KeychainWrapper.standard.data(forKey: ".auth"),
            let session = try? JSONDecoder().decode(AuthState.self, from: data),
            let expiration = KeychainWrapper.standard.double(forKey: ".auth.expiration") else {
            
            return false
        }
        
        if expiration > Date().timeIntervalSince1970 {
            self.current = session
            return true
        }
        
        return false
    }
    
    public func getSession() -> AuthState? {
        return current
    }
    
    func signIn(
        withUsername username: String,
        password: String,
        handler: @escaping (_ result: Bool)-> Void) {
        
        let parameters = [
            "grant_type": "password",
            "username": username,
            "password": password,
            "scope": scope
        ]
        
        let headers: HTTPHeaders = [
            .authorization(username: clientId, password: clientSecret)
        ]
        
        AF.request(tokenUrl, method: .post, parameters: parameters, headers: headers).response { response in
            if let data = response.data, let result = try? JSONDecoder().decode(AuthState.self, from: data) {
                self.persistSession(result)
                
                handler(true)
            } else {
                handler(false)
            }
        }
    }
}

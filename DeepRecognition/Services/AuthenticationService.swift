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

class AuthenticationService: AuthenticationServiceProtocol {
    private let tokenUrl = "\(AppSettings.baseUrl)/o/token/"
    private let clientId: String = "xebVxA8Syn5C9fRAL4ySdwnMhAsCgGIlaBnNAnfO"
    private let clientSecret: String = "VPpnoVE4aBOXHGXvPKiiq9gbUoNRQqxKIcHEM8Oi5ghhUqt0F26EMcoRmuOVMMSjTwhZsPZlK5G78MPk7SXPMj6nGWApBEJXRne5DzQaIRjwXqMcxc13IplppzkqYFSN"
    private let scope: String  = "all"
    
    @discardableResult
    public func persistSession(_ session: SessionState) -> Bool {
        Session.shared.current = session

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
            let session = try? JSONDecoder().decode(SessionState.self, from: data),
            let expiration = KeychainWrapper.standard.double(forKey: ".auth.expiration") else {
            
            return false
        }
        
        if expiration > Date().timeIntervalSince1970 {
            Session.shared.current = session
            return true
        } else {
            // TODO: Try to refresh access token
        }
        
        return false
    }
    
    public func signIn(
        withUsername username: String,
        password: String,
        handler: @escaping ((success: Bool, error: String?)) -> Void) {
        
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
            switch (response.result) {
            case .success(let data):
                do {
                    let session = try JSONDecoder().decode(SessionState.self, from: data!)
                    self.persistSession(session)
                    handler((true, nil))
                } catch {
                    handler((false, "\(error)"))
                }
            case .failure(let error):
                handler((false, "\(error)"))
            }
        }
    }
}

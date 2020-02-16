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
    
    func resfreshSession(
        with token: String,
        email: String,
        handler: @escaping (_ success: Bool) -> Void) {
        
        let parameters = [
            "grant_type": "refresh_token",
            "refresh_token": token,
        ]
        
        let headers: HTTPHeaders = [
            .authorization(username: clientId, password: clientSecret)
        ]
        
        AF.request(tokenUrl, method: .post, parameters: parameters, headers: headers).response { response in
            switch (response.result) {
            case .success(let data):
                do {
                    let session = try JSONDecoder().decode(SessionState.self, from: data!)
                    self.persistSession(session, email: email)
                    handler(true)
                } catch {
                    print(error)
                    handler(false)
                }
            case .failure(let error):
                print(error)
                handler(false)
            }
        }
    }
    
    public func signIn(
        with email: String,
        password: String,
        handler: @escaping ((success: Bool, error: String?)) -> Void) {
        
        let parameters = [
            "grant_type": "password",
            "username": email,
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
                    self.persistSession(session, email: email)
                    handler((true, nil))
                } catch {
                    handler((false, "\(error)"))
                }
            case .failure(let error):
                handler((false, "\(error)"))
            }
        }
    }
    
    public func checkSession() -> Bool {
        guard let data = KeychainWrapper.standard.data(forKey: ".auth"),
            let session = try? JSONDecoder().decode(SessionState.self, from: data),
            let email = KeychainWrapper.standard.string(forKey: ".auth.email"),
            let expiration = KeychainWrapper.standard.double(forKey: ".auth.expiration") else {
            
            return false
        }
                
        if expiration > Date().timeIntervalSince1970 + TimeInterval(15 * 60) {
            Session.shared.current = session
            Session.shared.currentUserEmail = email
            
            return true
        }
        
        var success = false
        self.resfreshSession(with: session.refreshToken, email: email) { success = $0 }
        
        return success
    }
    
    @discardableResult
    private func persistSession(_ session: SessionState, email: String) -> Bool {
        Session.shared.current = session
        Session.shared.currentUserEmail = email

        guard let data = try? JSONEncoder().encode(session) else {
            return false
        }
        
        let interval = TimeInterval(session.expiresIn)
        let expiration = Date().addingTimeInterval(interval).timeIntervalSince1970
        
        KeychainWrapper.standard.set(expiration, forKey: ".auth.expiration")
        KeychainWrapper.standard.set(email, forKey: ".auth.email")
        KeychainWrapper.standard.set(data, forKey: ".auth")
        
        return true
    }
}

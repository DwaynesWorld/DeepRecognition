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
        completion: @escaping (_ success: Bool) -> Void) {
        
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
                    completion(true)
                } catch {
                    print(error)
                    completion(false)
                }
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
    }
    
    public func signIn(
        with email: String,
        password: String,
        completion: @escaping ((success: Bool, error: String?)) -> Void) {
        
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
                    completion((true, nil))
                } catch {
                    completion((false, "\(error)"))
                }
            case .failure(let error):
                completion((false, "\(error)"))
            }
        }
    }
    
    func signOut(completion: @escaping () -> Void) {
        Session.shared.current = nil
        Session.shared.currentUserEmail = nil
        KeychainWrapper.standard.removeObject(forKey: ".auth.expiration")
        KeychainWrapper.standard.removeObject(forKey: ".auth.email")
        KeychainWrapper.standard.removeObject(forKey: ".auth")
        completion()
    }
    
    public func checkSession() -> Bool {
        guard let data = KeychainWrapper.standard.data(forKey: ".auth"),
            let session = try? JSONDecoder().decode(SessionState.self, from: data),
            let email = KeychainWrapper.standard.string(forKey: ".auth.email"),
            let expiration = KeychainWrapper.standard.double(forKey: ".auth.expiration") else {
            
            return false
        }
        
        let validation = Date().timeIntervalSince1970 + TimeInterval(15 * 60)
        
        if expiration > validation  {
            Session.shared.current = session
            Session.shared.currentUserEmail = email
            
            return true
        }
        
        var success = false
        resfreshSession(with: session.refreshToken, email: email) { success = $0 }
        
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

//
//  AuthServiceProtocol.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

protocol AuthenticationServiceProtocol {
    func signIn(
        with email: String,
        password: String,
        completion: @escaping (_ result: (success: Bool, error: String?)) -> Void)
    
    func signOut(completion: @escaping () -> Void)
    
    func resfreshSession(
        with token: String,
        email: String,
        completion: @escaping (_ success: Bool) -> Void)
    
    func checkSession() -> Bool
}

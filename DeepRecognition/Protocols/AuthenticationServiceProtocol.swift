//
//  AuthServiceProtocol.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

protocol AuthenticationServiceProtocol {
    @discardableResult
    func persistSession(_ session: SessionState) -> Bool
    func checkSession() -> Bool
    func signIn(withUsername username: String, password: String, handler: @escaping (_ result: (success: Bool, error: String?)) -> Void)
}

//
//  AuthResult.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/31/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

struct AuthState: Codable {
    let accessToken, tokenType: String
    let expiresIn: Int
    let refreshToken, scope: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case scope
    }
}

//
//  Authentication.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import OAuth2

class Authentication {
    
    let oauth2: OAuth2 = {
        let settings = AuthenticationSettings()
        let oauth2 = OAuth2CodeGrant(settings: settings.get())
        return oauth2
    }()
    
    let oauth: OAuth2? = {
        let settings = AuthenticationSettings()
        let oauth2 = Oauth2(settings: settings.get())
        return nil
    }()
    
    static let shared = Authentication()
    private init() {}
}

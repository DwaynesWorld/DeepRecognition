//
//  Authentication.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

// Name: DeepRecognition
// Grant Type: Authorization code
// Redirect URIs: https://app.deeprecognition.com/oauth/signin-redirect
// Client ID: cVxa6JFHU9iL2hT0hAQuoMJwFOgnmy1PJcxICu4d
// Client Secret:


struct OAuth2Configuration {
    var clientId: String
    var clientSecret: String
    var authorizeUri: String
    var tokenUri: String
    var redirectUri: String
    var scopes: String
    
    init() {
        self.clientId = ""
        self.clientSecret = ""
        self.authorizeUri = ""
        self.tokenUri = ""
        self.redirectUri = ""
        self.scopes = ""
    }
}



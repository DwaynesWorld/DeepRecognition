//
//  Authentication.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import OAuth2

// Name: DeepRecognition
// Grant Type: Authorization code
// Redirect URIs: https://app.deeprecognition.com/oauth/signin-redirect
// Client ID: cVxa6JFHU9iL2hT0hAQuoMJwFOgnmy1PJcxICu4d
// Client Secret:

struct AuthenticationSettings: Codable {
    var clientId: String
    var clientSecret: String
    var authorizeUri: String
    var tokenUri: String
    var redirectUri: String
    var scopes: String
    
    init() {
        self.clientId = "xebVxA8Syn5C9fRAL4ySdwnMhAsCgGIlaBnNAnfO"
        self.clientSecret = "VPpnoVE4aBOXHGXvPKiiq9gbUoNRQqxKIcHEM8Oi5ghhUqt0F26EMcoRmuOVMMSjTwhZsPZlK5G78MPk7SXPMj6nGWApBEJXRne5DzQaIRjwXqMcxc13IplppzkqYFSN"
        self.authorizeUri = "https://app.7geese.com/o/authorize"
        self.tokenUri = "https://app.7geese.com/o/token"
        self.redirectUri = "https://app.deeprecognition.com/oauth/signin-redirect"
        self.scopes = "all"
    }
    
    func get() -> OAuth2JSON {
        let settings = [
            "client_id": self.clientId,
            "client_secret": self.clientSecret,
            "authorize_uri": self.authorizeUri,
            "token_uri": self.tokenUri,
            "redirect_uris": [ self.redirectUri ],
            "scope": self.scopes,
            "secret_in_body": false,
            "keychain": true,
        ] as OAuth2JSON
        
        return settings
    }
}



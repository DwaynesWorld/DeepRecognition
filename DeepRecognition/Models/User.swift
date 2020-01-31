//
//  User.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 01/30/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

struct User: Codable {
    let url, id, username, firstName: String
    let lastName, email: String
    let isActive: Bool
    let dateJoined: String

    enum CodingKeys: String, CodingKey {
        case url, id, username
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case isActive = "is_active"
        case dateJoined = "date_joined"
    }
}

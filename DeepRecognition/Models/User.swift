//
//  User.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 01/30/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

struct User: Codable {
    let firstName: String?
    let lastName: String?
    let isActive: Bool?
    let email: String?
    let dateJoined: String?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case isActive = "is_active"
        case email = "email"
        case dateJoined = "date_joined"
    }
}

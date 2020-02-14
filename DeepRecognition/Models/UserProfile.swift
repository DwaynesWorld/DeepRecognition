//
//  UserProfile.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

struct UserProfile: Codable {
    let url: String
    let id: Int
    let user: User
    let reportsTo: String?
    let activated: Bool?
    let isManager: Bool?
    let username: String?
    let profileImg: String?
    let position: String?
    let phoneNumber: String?
    let hireDate: String?

    enum CodingKeys: String, CodingKey {
        case url
        case id
        case user
        case reportsTo = "reports_to"
        case activated
        case isManager = "is_manager"
        case username
        case profileImg = "profile_img"
        case position
        case phoneNumber = "phone_number"
        case hireDate = "hire_date"
    }
}

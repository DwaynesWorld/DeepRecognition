//
//  DepartmentMember.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

struct DepartmentMember: Codable {
    let url: String
    let id: Int
    let department: Department?
    let userProfile: UserProfile?
    let joined: Date?

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case department = "department"
        case userProfile = "user_profile"
        case joined = "joined"
    }
}

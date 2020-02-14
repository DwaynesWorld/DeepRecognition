//
//  Department.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

struct Department: Codable {
    let url: String
    let id: Int
    let creator: UserProfile?
    let network: String?
    let parent: String?
    let teamManagedBy: Int?
    let name: String?
    let deleted: Bool?
    let created: String?
    let modified: String?
    let fullName: String?
    let members: [String]

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case creator = "creator"
        case network = "network"
        case parent = "parent"
        case teamManagedBy = "team_managed_by"
        case name = "name"
        case deleted = "deleted"
        case created = "created"
        case modified = "modified"
        case fullName = "full_name"
        case members = "members"
    }
}

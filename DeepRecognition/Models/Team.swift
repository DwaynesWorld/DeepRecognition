//
//  Team.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/15/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

struct Team: Codable {
    let id: Int?
    let parentId: Int?
    let fullName: String?
    let name: String
    let employeeCount: Int
}

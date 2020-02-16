//
//  UserProfile.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

struct UserProfile: Codable {
    let id: Int?
    let email: String?
    let firstName: String?
    let lastName: String?
    let reportsTo: Int?
    let activationState: String?
    let isManager: Bool?
    let profileImageUrl: String?
    let position: String?
    let phoneNumber: String?
    let hireDate: String?
}

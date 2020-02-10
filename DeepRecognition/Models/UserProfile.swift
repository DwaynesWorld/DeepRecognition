//
//  UserProfile.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

struct UserProfile: Codable {
    let url, id: String
    let user: User
    let network, reportsTo, profileImageURL: String
    let activated, isManager, managerManuallySet, isAdmin: Bool
    let adminContentVisibility: Int
    let canChangeAdminContentVisibility, isBetaUser: Bool
    let username, profileImg, yammerImageTemplate, position: String
    let phoneNumber: String
    let activationState: Int
    let lastPageLoadTime, deactivatedTimestamp, twitterProfile, linkedinProfile: String
    let facebookProfile, yammerProfile, employeeID, timezone: String
    let about: String
    let isBeingDeleted: Bool
    let hrisID: String
    let emailBounced: Bool
    let hireDate: String

    enum CodingKeys: String, CodingKey {
        case url, id, user, network
        case reportsTo = "reports_to"
        case profileImageURL = "profile_image_url"
        case activated
        case isManager = "is_manager"
        case managerManuallySet = "manager_manually_set"
        case isAdmin = "is_admin"
        case adminContentVisibility = "admin_content_visibility"
        case canChangeAdminContentVisibility = "can_change_admin_content_visibility"
        case isBetaUser = "is_beta_user"
        case username
        case profileImg = "profile_img"
        case yammerImageTemplate = "yammer_image_template"
        case position
        case phoneNumber = "phone_number"
        case activationState = "activation_state"
        case lastPageLoadTime = "last_page_load_time"
        case deactivatedTimestamp = "deactivated_timestamp"
        case twitterProfile = "twitter_profile"
        case linkedinProfile = "linkedin_profile"
        case facebookProfile = "facebook_profile"
        case yammerProfile = "yammer_profile"
        case employeeID = "employee_id"
        case timezone, about
        case isBeingDeleted = "is_being_deleted"
        case hrisID = "hris_id"
        case emailBounced = "email_bounced"
        case hireDate = "hire_date"
    }
}

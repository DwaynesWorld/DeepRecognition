//
//  Setting.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/18/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class Setting: NSObject {
    let name: SettingName
    let imageName: String
    
    init(name: SettingName, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

enum SettingName: String {
    case settings = "Settings"
    case terms = "Terms & Conditions"
    case feedback = "Send Feedback"
    case help = "Help"
    case switchAccounts = "Switch Accounts"
    case cancel = "Cancel"
}


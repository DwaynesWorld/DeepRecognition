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
    let icon: UIImage
    
    init(name settingName: SettingName, image: UIImage) {
        name = settingName
        icon = image
    }
}

enum SettingName: String {
    case settings = "Settings"
    case terms = "Terms & Conditions"
    case feedback = "Send Feedback"
    case help = "Help"
    case logout = "Logout"
    case cancel = "Cancel"
}


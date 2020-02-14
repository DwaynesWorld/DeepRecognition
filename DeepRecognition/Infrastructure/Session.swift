//
//  CurrentSession.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

class Session {
    public var current: SessionState? = nil
    
    public static var shared = Session()
    private init() {}
}

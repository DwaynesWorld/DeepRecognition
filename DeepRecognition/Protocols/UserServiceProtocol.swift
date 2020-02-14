//
//  UserServiceProtocol.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

protocol UserServiceProtocol {
    func getCurrentUser(handler: @escaping (_ result: (data: UserProfile?, error: RequestError?)) -> Void)
}

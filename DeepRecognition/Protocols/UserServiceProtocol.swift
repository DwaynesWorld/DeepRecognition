//
//  UserServiceProtocol.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

protocol UserServiceProtocol {
    func getUser(fromId id: Int, completion: @escaping (_ result: (data: UserProfile?, error: RequestError?)) -> Void)
    func getUser(fromEmail email: String, completion: @escaping (_ result: (data: UserProfile?, error: RequestError?)) -> Void)
    func getUsers(fromSearch search: String, completion: @escaping (_ result: (data: [UserProfile]?, error: RequestError?)) -> Void)
}

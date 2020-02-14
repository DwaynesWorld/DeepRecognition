//
//  RequestError.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case invalidSession
    case invalidRequest(error: String)
    case unexpectedResponse(error: String)
}

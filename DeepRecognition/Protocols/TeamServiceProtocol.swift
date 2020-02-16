//
//  TeamServiceProtocol.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kylesz Thompson. All rights reserved.
//

import Foundation

protocol TeamServiceProtocol {
    func getTeams(handler: @escaping (_ result: (data: [Team]?, error: RequestError?)) -> Void)
}

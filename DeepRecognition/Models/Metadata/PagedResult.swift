//
//  PagedResult.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

struct PagedResult<Element: Codable>: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Element]

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
    }
}

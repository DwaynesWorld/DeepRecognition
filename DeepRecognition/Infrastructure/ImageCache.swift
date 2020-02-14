//
//  ImageCache.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 01/24/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class ImageCache {
    
    let cache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200
        return cache
    }()
    
    static let shared = ImageCache()
    private init() {}
}

//
//  CMTime.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 01/27/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import AVFoundation

extension CMTime {
    
    func getTimeStampString() -> String {
        
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let _hours = totalSeconds / 3600
        let hours = String(format: "%02d", _hours)
        let minutes = String(format: "%02d", totalSeconds / 60)
        let seconds = String(format: "%02d", totalSeconds % 60)
        
        if _hours > 0 {
            return "\(hours):\(minutes):\(seconds)"
        }
        
        return "\(minutes):\(seconds)"
        
    }
}

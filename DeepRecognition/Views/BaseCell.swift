//
//  BaseCell.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/9/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

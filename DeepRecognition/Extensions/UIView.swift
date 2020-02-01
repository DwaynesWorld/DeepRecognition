//
//  UIView.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 01/23/20.
//  Copyright © 2018 Kyle Thompson. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraints(withformat format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        let constraints = NSLayoutConstraint.constraints(
            withVisualFormat: format,
            options: NSLayoutConstraint.FormatOptions(),
            metrics: nil,
            views: viewsDictionary)
        
        addConstraints(constraints)
    }
}

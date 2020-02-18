//
//  EmployeeListView.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/18/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Lottie

class EmployeeListView: BaseView {
    public let loadingView: AnimationView = {
        let view = AnimationView(frame: .zero)
        view.animation = Animation.named("loading", subdirectory: "Assets/Animations")
        view.contentMode = .scaleAspectFit
        view.backgroundBehavior = .pauseAndRestore
        view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        view.isHidden = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setup() {
        super.setup()
        
    }
    
    func setupView() {
    
    }
    
    func setupSubviews() {
        addSubview(loadingView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            loadingView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            loadingView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            loadingView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20)
        ])
    }
}

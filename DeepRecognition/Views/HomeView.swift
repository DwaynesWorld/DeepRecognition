//
//  HomeView.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class HomeView: BaseView {
    public let homeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setup() {
        super.setup()
        
        setupView()
        setupSubViews()
        setupConstraints()
    }
    
    private func setupView() {
        backgroundColor = .white
    }
    
    private func setupSubViews() {
        addSubview(homeLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            homeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            homeLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20),
        ])
    }
}

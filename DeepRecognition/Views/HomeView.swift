//
//  HomeView.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class HomeView: BaseView {
    public let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello,"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Kyle!"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let lastView: LastRecognitionView = {
        let view = LastRecognitionView(frame: CGRect(x: 0, y: 0, width: 200, height: 75))
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubview(greetingLabel)
        addSubview(nameLabel)
        addSubview(lastView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            greetingLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 2),
            nameLabel.leftAnchor.constraint(equalTo: greetingLabel.leftAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            lastView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            lastView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            lastView.widthAnchor.constraint(equalToConstant: 225)
        ])
    }
}

class LastRecognitionView: BaseView {
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Last Recognition"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.light)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "02:56:45 minutes"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lastTime: Int? {
        didSet {
            
        }
    }
    
    override func setup() {
        super.setup()
        
        setupView()
        setupSubViews()
        setupConstraints()
    }
        
    private func setupView() {
        backgroundColor = .green
    }
    
    private func setupSubViews() {
        addSubview(titleLabel)
        addSubview(timeLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            timeLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0)
        ])
    }
}

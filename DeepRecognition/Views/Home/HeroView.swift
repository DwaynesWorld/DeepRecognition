//
//  HeroView.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/1/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//


import UIKit
import SwiftIcons


class HeroView: BaseView {
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Last Recognition"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        label.textColor = UIColor(white: 0.9, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "02:56:45 minutes ago"
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.heavy)
        label.textColor = UIColor(white: 0.9, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let heroImage: UIImageView = {
        let image = UIImageView()
        image.setIcon(icon: .googleMaterialDesign(.alarm),
                      textColor: .rgb(224, 169, 67),
                      size: CGSize(width: 60, height: 60))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        backgroundColor = .rgb(52, 156, 184)
        layer.cornerRadius = 12
        layer.masksToBounds = true
    }
    
    private func setupSubViews() {
        addSubview(titleLabel)
        addSubview(timeLabel)
        addSubview(heroImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            timeLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            heroImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            heroImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30)
        ])
    }
}

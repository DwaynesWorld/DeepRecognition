//
//  GroupCell.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/9/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class GroupCell: BaseCell {
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dev")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    public let departmentCount: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "113 Employees"
        label.font = .systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        label.textColor = .rgb(199, 74, 77)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let departmentName: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Development"
        label.font = .systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
        label.textColor = .rgb(30, 46, 52)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let recognitionsLastWeekCount: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "22 recognitions last week"
        label.font = .systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = .rgb(145, 145, 145)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let recognitionsByYouCount: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "0 recognitions from you last week"
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        label.textColor = .rgb(145, 145, 145)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func setup() {
        super.setup()
        
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupView(){
        backgroundColor = .white
        layer.cornerRadius = 12
        layer.masksToBounds = true
    }
    

    private func setupSubviews() {
        addSubview(imageView)
        addSubview(departmentCount)
        addSubview(departmentName)
        addSubview(recognitionsLastWeekCount)
        addSubview(recognitionsByYouCount)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        NSLayoutConstraint.activate([
            departmentCount.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 25),
            departmentCount.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            departmentCount.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            departmentCount.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            departmentName.topAnchor.constraint(equalTo: departmentCount.bottomAnchor, constant: 10),
            departmentName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            departmentName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            departmentName.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            recognitionsLastWeekCount.topAnchor.constraint(equalTo: departmentName.bottomAnchor, constant: 15),
            recognitionsLastWeekCount.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            recognitionsLastWeekCount.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            recognitionsLastWeekCount.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            recognitionsByYouCount.topAnchor.constraint(equalTo: recognitionsLastWeekCount.bottomAnchor, constant: 2),
            recognitionsByYouCount.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            recognitionsByYouCount.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            recognitionsByYouCount.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
}

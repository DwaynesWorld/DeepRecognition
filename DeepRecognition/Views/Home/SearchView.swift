//
//  SearchView.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/1/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//


import UIKit
import SwiftIcons

class SearchView: BaseView {
    
    public let searchField: UITextField = {
        let field = UITextField(frame: .zero)
        
        field.attributedPlaceholder = NSAttributedString(
            string: "Search for a co-worker",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        field.backgroundColor = .white
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    public let searchButton: UIButton = {
        let button = UIButton(frame: .zero)
        
        button.setIcon(
            icon: .googleMaterialDesign(.search),
            iconSize: 26.0,
            color: .white,
            backgroundColor: .rgb(63, 89, 100),
            forState: .normal)
        
        button.showsTouchWhenHighlighted = true
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setup() {
        super.setup()
        
        setupView()
        setupSubViews()
        setupConstraints()
    }
        
    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    private func setupSubViews() {
        addSubview(searchField)
        addSubview(searchButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            searchField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            searchField.rightAnchor.constraint(equalTo: rightAnchor, constant: -60),
            searchField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            searchButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}

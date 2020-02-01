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
        label.text = "Kyle."
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.heavy)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let lastView: HeroView = {
        let view = HeroView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let searchView: SearchView = {
        let view = SearchView(frame: .zero)
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
        addSubview(searchView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            greetingLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 15),
            greetingLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 3),
            nameLabel.leftAnchor.constraint(equalTo: greetingLabel.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: greetingLabel.rightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            lastView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            lastView.leftAnchor.constraint(equalTo: greetingLabel.leftAnchor),
            lastView.rightAnchor.constraint(equalTo: greetingLabel.rightAnchor),
            lastView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: lastView.bottomAnchor, constant: 20),
            searchView.leftAnchor.constraint(equalTo: self.leftAnchor),
            searchView.rightAnchor.constraint(equalTo: self.rightAnchor),
            searchView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

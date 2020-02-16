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
        label.text = "Hello"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.heavy)
        label.textColor = .rgb(30, 46, 52)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let promptLabel: UILabel = {
        let label = UILabel()
        label.text = "Who would you like to recognize today? Search Below."
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
        label.textColor = .rgb(111, 120, 129)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let searchView: SearchView = {
        let view = SearchView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let teamSection: TeamsView = {
        let view = TeamsView(frame: .zero)
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
        backgroundColor = .rgb(242, 245, 248)
    }
    
    private func setupSubViews() {
        addSubview(greetingLabel)
        addSubview(promptLabel)
        addSubview(searchView)
        addSubview(teamSection)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            greetingLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30),
            greetingLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            promptLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 5),
            promptLabel.leftAnchor.constraint(equalTo: greetingLabel.leftAnchor),
            promptLabel.rightAnchor.constraint(equalTo: greetingLabel.rightAnchor),
        ])
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 50),
            searchView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            searchView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            searchView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            teamSection.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 40),
            teamSection.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            teamSection.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            teamSection.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20)
        ])
    }
}

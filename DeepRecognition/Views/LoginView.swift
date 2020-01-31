//
//  LoginView.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 01/30/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class LoginView: BaseView {
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "DeepRecognition"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let logo: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "flame")?.withRenderingMode(.alwaysTemplate)
        view.image = image
        view.tintColor = primaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back, Please Login to your account."
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let signupLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account? Signup"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        label.textColor = primaryColor
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.backgroundColor = UIColor(white: 1, alpha: 0.95)
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    public let passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.backgroundColor = UIColor(white: 1, alpha: 0.95)
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    public let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot Password?"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        label.textColor = .darkGray
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(primaryTextColor, for: .normal)
        button.backgroundColor = primaryColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "By Signing up, you agree to Deep Recognition's"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let termsLabel: UILabel = {
        let label = UILabel()
        label.text = "Terms & Conditions and Privacy Policy"
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.bold)
        label.textColor = .darkGray
        label.isUserInteractionEnabled = true
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
        addSubview(titleLabel)
        addSubview(logo)
        addSubview(welcomeLabel)
        addSubview(signupLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(forgotPasswordLabel)
        addSubview(loginButton)
        addSubview(footerLabel)
        addSubview(termsLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20),
            logo.widthAnchor.constraint(equalToConstant: 150),
        ])
        
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0),
            logo.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            logo.widthAnchor.constraint(equalToConstant: 50),
            logo.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            welcomeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            welcomeLabel.widthAnchor.constraint(equalToConstant: 250),
        ])
        
        NSLayoutConstraint.activate([
            signupLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 4),
            signupLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            signupLabel.widthAnchor.constraint(equalToConstant: 250),
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: signupLabel.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            emailTextField.rightAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
            emailTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            passwordTextField.rightAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
            passwordTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 2),
            forgotPasswordLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 5),
            forgotPasswordLabel.widthAnchor.constraint(equalToConstant: 150),
            forgotPasswordLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            footerLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60),
            footerLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            footerLabel.widthAnchor.constraint(equalToConstant: 250),
            footerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            termsLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -45),
            termsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            termsLabel.widthAnchor.constraint(equalToConstant: 250),
            termsLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

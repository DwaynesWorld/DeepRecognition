//
//  LoginView.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 01/30/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit
import SwiftIcons

class LoginView: BaseView {
    
    public let logo: UIImageView = {
        let view = UIImageView()
        let image = UIImage(named: "digital-brain")?.withRenderingMode(.alwaysTemplate)
        view.image = image
        view.tintColor = .rgb(63, 89, 100)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "DeepRecognition"
        label.textAlignment = .center
        label.textColor = .rgb(30, 46, 52)
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    public let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back, Please Login to your account to get started."
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let signupLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account? Signup"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.medium)
        label.textColor = .rgb(63, 89, 100)
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
        field.tag = 0
        
        field.text = "kyle.thompson@hcss.com"
        
        return field
    }()
    
    public let passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.backgroundColor = UIColor(white: 1, alpha: 0.95)
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        field.tag = 1
        
        field.text = ""
        
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
        let image =  UIImage.init(
            icon: .ionicons(IoniconsType.arrowRightC),
            size: CGSize(width: 30, height: 30),
            textColor: .white,
            backgroundColor: .clear)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        imageView.backgroundColor = .rgb(59, 92, 93)
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let button = UIButton(type: .system)
        button.setTitle("LOGIN", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .rgb(74, 107, 108)
        button.addSubview(imageView)
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor, constant: 0),
            imageView.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30),
        ])

        return button
    }()
    
    public let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "By Signing up, you agree to Deep Recognition's"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let termsLabel: UILabel = {
        let label = UILabel()
        label.text = "Terms & Conditions and Privacy Policy"
        label.textAlignment = .center
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
        addSubview(logo)
        addSubview(titleLabel)
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
            logo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            logo.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            logo.widthAnchor.constraint(equalToConstant: 65),
            logo.heightAnchor.constraint(equalToConstant: 65)
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 5),
            titleLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            welcomeLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            welcomeLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
        ])
        
        NSLayoutConstraint.activate([
            signupLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 4),
            signupLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            signupLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: signupLabel.bottomAnchor, constant: 50),
            emailTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            emailTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            passwordTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 2),
            forgotPasswordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 1),
            forgotPasswordLabel.widthAnchor.constraint(equalToConstant: 125),
            forgotPasswordLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 20),
            loginButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 70),
            loginButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -70),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            footerLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -60),
            footerLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            footerLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
            footerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            termsLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -45),
            termsLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 50),
            termsLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -50),
            termsLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

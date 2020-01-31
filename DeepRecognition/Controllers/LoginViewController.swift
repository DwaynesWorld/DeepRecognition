//
//  LoginViewController.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var isLoggingIn = true
    
    unowned var loginView: LoginView { self.view as! LoginView }
    unowned var emailTextField: UITextField { loginView.emailTextField }
    unowned var passwordTextField: UITextField { loginView.passwordTextField }
    unowned var forgotPasswordLabel: UILabel { loginView.forgotPasswordLabel }
    unowned var loginButton: UIButton { loginView.loginButton }
    unowned var signupLabel: UILabel { loginView.signupLabel }
    unowned var termsLabel: UILabel { loginView.termsLabel }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupActions()
    }
    
    public override func loadView() {
        self.view = LoginView()
    }
    
    private func setupActions() {
        loginButton.addTarget(self, action: #selector(LoginViewController.handleLogin), for: .touchUpInside)
        
        let signupTapped = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleSignup))
        signupLabel.addGestureRecognizer(signupTapped)
        
        let forgotPasswordTapped = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleForgotPassword))
        forgotPasswordLabel.addGestureRecognizer(forgotPasswordTapped)
        
        let termsAndConditionsTapped = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleTermsAndConditions))
        termsLabel.addGestureRecognizer(termsAndConditionsTapped)
    }
    
    @objc func handleLogin() {
        guard let email = emailTextField.text, email.count > 0 else {
            // set invalid label
            return
        }
        
        guard let password = passwordTextField.text, password.count > 0 else {
            // set invalid label
            return
        }
        
        
        
//        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            if result != nil {
//                self.present(MainTabBarController(), animated: true, completion: nil)
//            }
//        }
    }
    
    @objc func handleSignup() {
        // Launch 7Geese Url
    }
    
    @objc func handleForgotPassword() {
        print("forgot pass")
    }
    
    @objc func handleTermsAndConditions() {
        print("terms and cons")
    }
}

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
    let authenticationService = AppDelegate.container.resolve(AuthenticationServiceProtocol.self)!
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        if isSignedIn() {
            let home = HomeViewController()
            home.modalPresentationStyle = .fullScreen
            self.present(home, animated: true, completion: nil)
        }
    }
    
    public override func loadView() {
        self.view = LoginView()
    }
    
    private func isSignedIn() -> Bool {
        return self.authenticationService.checkSession()
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
        
        self.authenticationService.signIn(with: email, password: password) { result in
            if result.success {
                let home = HomeViewController()
                home.modalPresentationStyle = .fullScreen
                self.present(home, animated: true, completion: nil)
            } else {
                print("Invalid login: \(result.error ?? "An unexpected error has occurred.")")
            }
        }
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

//
//  LoginViewController.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 1/25/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private var isLoggingIn = true
    private let authenticationService = AppDelegate.container.resolve(AuthenticationServiceProtocol.self)!
    
    unowned var loginView: LoginView { self.view as! LoginView }
    unowned var emailTextField: UITextField { loginView.emailTextField }
    unowned var passwordTextField: UITextField { loginView.passwordTextField }
    unowned var forgotPasswordLabel: UILabel { loginView.forgotPasswordLabel }
    unowned var loginButton: UIButton { loginView.loginButton }
    unowned var signupLabel: UILabel { loginView.signupLabel }
    unowned var termsLabel: UILabel { loginView.termsLabel }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        setupActions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        if isSignedIn() {
//            let home = HomeViewController()
//            home.modalPresentationStyle = .fullScreen
//            self.present(home, animated: true, completion: nil)
//        }
    }
    
    public override func loadView() {
        view = LoginView()
    }
    
    private func setupActions() {
        loginButton.addTarget(
            self,
            action: #selector(LoginViewController.handleLogin),
            for: .touchUpInside)
        
        let tap = UITapGestureRecognizer(
            target: self.loginView,
            action: #selector(loginView.endEditing))
        tap.cancelsTouchesInView = false
        loginView.addGestureRecognizer(tap)
        
        let signupTapped = UITapGestureRecognizer(
            target: self,
            action: #selector(LoginViewController.handleSignup))
        signupLabel.addGestureRecognizer(signupTapped)
        
        let forgotPasswordTapped = UITapGestureRecognizer(
            target: self,
            action: #selector(LoginViewController.handleForgotPassword))
        forgotPasswordLabel.addGestureRecognizer(forgotPasswordTapped)
        
        let termsAndConditionsTapped = UITapGestureRecognizer(
            target: self,
            action: #selector(LoginViewController.handleTermsAndConditions))
        termsLabel.addGestureRecognizer(termsAndConditionsTapped)
    }
    
    private func isSignedIn() -> Bool {
        return authenticationService.checkSession()
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
        
        authenticationService.signIn(with: email, password: password) { [unowned self] result in
            if result.success {
                let main = MainController()
                main.modalPresentationStyle = .fullScreen
                self.present(main, animated: true, completion: nil)
            } else {
                print("Invalid login: \(result.error ?? "An unexpected error has occurred.")")
            }
        }
    }
    
    @objc func handleSignup() {
        // Launch 7Geese Url
        print("signup")
    }
    
    @objc func handleForgotPassword() {
        print("forgot pass")
    }
    
    @objc func handleTermsAndConditions() {
        print("terms and cons")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    
}

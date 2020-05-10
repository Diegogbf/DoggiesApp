//
//  ViewController.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 08/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Constants
    private let loginView = LoginView()
    private lazy var viewModel: LoginViewModelType = LoginViewModel(delegate: self)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    // MARK: - Setup
    private func setup() {
        loginView.emailTextField.delegate = self
        loginView.signinButton.addTarget(self, action: #selector(signin), for: .touchUpInside)
    }
    
    @objc private func signin() {
        guard let email = loginView.emailTextField.text else { return }
        //Email validation
        viewModel.signin(email: email)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Email validation
    }
}

extension LoginViewController: LoginViewControllerFeedback {
    func loader(show: Bool) {
        // Loader on button
    }
    
    func succesSignin() {
        //Open Feed
    }
    
    func showError(msg: String) {
        showErrorAlert(msg: msg)
    }
}


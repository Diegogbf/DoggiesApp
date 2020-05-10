//
//  ViewController.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 08/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class LoginViewController: CustomViewController<LoginView> {
    
    // MARK: - Constants
    private lazy var viewModel: LoginViewModelType = LoginViewModel(delegate: self)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        contentView.signinButton.addTarget(self, action: #selector(signin), for: .touchUpInside)
    }
    
    @objc private func signin() {
        guard let email = contentView.emailTextField.text else { return }
        if email.isValidEmail {
            viewModel.signin(email: email)
        }
    }
}

extension LoginViewController: LoginViewControllerFeedback {
    func loader(show: Bool) {
        show ? contentView.signinButton.showLoader() : contentView.signinButton.hideLoader()
    }
    
    func succesSignin() {
        //Open Feed
    }
    
    func showError(msg: String) {
        showErrorAlert(msg: msg)
    }
}


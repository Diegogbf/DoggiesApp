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
        if contentView.emailTextField.isValid {
            guard let email = contentView.emailTextField.text else { return }
            viewModel.signin(email: email)
        } else {
            showError(msg: "E-mail inválido")
        }
    }
}

extension LoginViewController: LoginViewControllerFeedback {
    func loader(show: Bool) {
        show ? contentView.signinButton.showLoader() : contentView.signinButton.hideLoader()
    }
    
    func succesSignin() {
        let feedNav = UINavigationController(
            rootViewController: FeedViewController(
                viewModel: FeedViewModel(
                    repository: FeedRepository(),
                    filterOptions: [.husky, .hound, .pug, .labrador]
                )
            )
        )
        feedNav.modalPresentationStyle = .fullScreen
        present(feedNav, animated: true, completion: nil)
    }
    
    func showError(msg: String) {
        showErrorAlert(msg: msg)
    }
}


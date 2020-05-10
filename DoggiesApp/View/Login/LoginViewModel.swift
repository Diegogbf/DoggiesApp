//
//  LoginViewModel.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import Foundation

protocol LoginViewControllerFeedback: class {
    func loader(show: Bool)
    func succesSignin()
    func showError(msg: String)
}

protocol LoginViewModelType {
    func signin(email: String)
    init(delegate: LoginViewControllerFeedback)
}

final class LoginViewModel: LoginViewModelType {
    
    // MARK: - Constants
    private weak var delegate: LoginViewControllerFeedback?
    
    // MARK: - Init
    init(delegate: LoginViewControllerFeedback) {
        self.delegate = delegate
    }
    
    // MARK: - Api Request
    func signin(email: String) {
        delegate?.loader(show: true)
        ServiceLayer.request(
            route: Router.signup(request: User(email: email)),
            onSuccess: { [weak self] (userResponse: UserResponse) in
                guard let self = self else { return }
                self.delegate?.loader(show: false)
                if let userToken = userResponse.user?.token {
                    self.storeUserToken(accessToken: userToken)
                    self.delegate?.succesSignin()
                } else {
                    self.delegate?.showError(msg: "Missing User Token")
                }
            },
            onError: { [weak self] erroMsg in
                guard let self = self else { return }
                self.delegate?.loader(show: false)
                self.delegate?.showError(msg: erroMsg)
            }
        )
    }
    
    private func storeUserToken(accessToken: String) {
        LocalPersistence.shared[.accessToken] = accessToken
    }
}

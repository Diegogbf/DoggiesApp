//
//  LoginView.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    // MARK: - Components
    lazy var emailTextField: UITextField = {
        let emailTextField = CustomTextField(type: .email)
        return emailTextField
    }()
    
    lazy var signinButton: UIButton = {
        let signinButton = UIButton(frame: .zero)
        signinButton.setTitle("Sign In", for: .normal)
        signinButton.backgroundColor = .blue
        signinButton.layer.cornerRadius = Layout.signinButtonCornerRadius
        return signinButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, signinButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Layout.elementsDistance
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private enum Layout {
        static let signinButtonCornerRadius: CGFloat = 8
        static let stackViewEdgesDistance: CGFloat = 16
        static let elementsDistance: CGFloat = 8
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .white
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(Layout.stackViewEdgesDistance)
        }
    }
}


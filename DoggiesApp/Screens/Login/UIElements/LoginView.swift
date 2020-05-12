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
    lazy var emailTextField: CustomTextField = {
        let emailTextField = CustomTextField(type: .email)
        return emailTextField
    }()
    
    lazy var signinButton: CustomButton = {
        let signinButton = CustomButton(title: "Sign In")
        signinButton.backgroundColor = .mainColor
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
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "dog")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var containerView: UIView = {
        let containerView = UIView(frame: .zero)
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = Layout.contenViewRadius
        return containerView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.textColor = .white
        titleLabel.text = "DoggiesApp"
        titleLabel.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        return titleLabel
    }()
    
    private enum Layout {
        static let signinButtonCornerRadius: CGFloat = 16
        static let stackViewEdgesDistance: CGFloat = 32
        static let elementsDistance: CGFloat = 16
        static let contenViewRadius: CGFloat = 30
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .mainColor
        [imageView, containerView].forEach { addSubview($0) }
        containerView.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Layout.stackViewEdgesDistance)
        }
        
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(Layout.stackViewEdgesDistance)
            $0.centerY.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}


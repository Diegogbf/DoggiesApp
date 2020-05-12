//
//  CustomButton.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit
import SnapKit

class CustomButton: UIButton {
    
    // MARK: - Variables
    private var title: String
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .white
        return activityIndicator
    }()
    
    // MARK: - Init
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            titleLabel?.alpha = isHighlighted ? 0.5 : 1.0
        }
    }
    
    // MARK: - setup
    private func setup() {
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    // MARK: - Loader Handling
    private func setActivityIndicator() {
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        setTitle("", for: .normal)
    }
    
    func showLoader() {
        if !subviews.contains(activityIndicator) { setActivityIndicator() }
        activityIndicator.startAnimating()
    }
    
    func hideLoader() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        setTitle(title, for: .normal)
    }
}

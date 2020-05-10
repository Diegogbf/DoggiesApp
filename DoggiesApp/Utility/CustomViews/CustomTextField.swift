//
//  CustomTextField.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

enum TextFieldType: String {
    case email = "E-mail"
}

class CustomTextField: UITextField {
    
    // MARK: - Variables
    var type: TextFieldType
    
    // MARK: - Init
    init(type: TextFieldType) {
        self.type = type
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setup() {
        placeholder = type.rawValue
        tintColor = .black
        borderStyle = .roundedRect
        delegate = self
        
        switch type {
        case .email:
            keyboardType = .emailAddress
        }
    }
    
    var isValid: Bool {
        guard let text = text else { return false }
        switch type {
        case .email:
            return text.isValidEmail
        }
    }
}

// MARK: - UITextFieldDelegate
extension CustomTextField: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderColor = isValid ? UIColor.gray.cgColor : UIColor.red.cgColor
    }
}


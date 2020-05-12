//
//  DoggiesAppTests.swift
//  DoggiesAppTests
//
//  Created by Diego Gomes on 08/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import XCTest
@testable import DoggiesApp

class LoginTests: XCTestCase {
    
    func testEmailValidation() {
        let wrongEmail = "diego.com"
        let rightEmail = "diego@gmail.com"
        XCTAssertFalse(wrongEmail.isValidEmail)
        XCTAssertTrue(rightEmail.isValidEmail)
    }
    
    func testEmailFieldValidation() {
        let wrongEmail = "diego.com"
        let rightEmail = "diego@gmail.com"
        XCTAssertFalse(createLogin(with: wrongEmail).contentView.emailTextField.isValid)
        XCTAssertTrue(createLogin(with: rightEmail).contentView.emailTextField.isValid)
    }
    
    func createLogin(with email: String) -> LoginViewController {
        let loginVc = LoginViewController()
        loginVc.loadViewIfNeeded()
        loginVc.contentView.emailTextField.text = email
        return loginVc
    }

}

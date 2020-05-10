//
//  CustomViewController.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class CustomViewController<ContentView: UIView>: UIViewController {
    
    // MARK: - Variable
    var contentView = ContentView()
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardOnViewTouch()
    }
    
    // MARK: - Handling Keyboard
    private func dismissKeyboardOnViewTouch() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
    }
    
    @objc private func viewTapped() {
        view.endEditing(true)
    }
}

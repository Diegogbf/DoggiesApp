//
//  String+Extensions.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let regex = NSRegularExpression("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return regex.matches(self)
    }
}

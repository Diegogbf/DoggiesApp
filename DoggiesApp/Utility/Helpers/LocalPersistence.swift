//
//  KeychainHelper.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

enum StoredKeys: String {
    case accessToken
}

class LocalPersistence {
    static let shared = LocalPersistence()
}

extension LocalPersistence {
    subscript(_ key: StoredKeys) -> String {
        get {
            return KeychainWrapper.standard.string(forKey: key.rawValue) ?? ""
        }
        set {
            KeychainWrapper.standard.set(newValue, forKey: key.rawValue)
        }
    }
}

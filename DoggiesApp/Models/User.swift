//
//  Signup.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import Foundation

// MARK: - UserResponse
struct UserResponse: Decodable {
    var user: User?
}

// MARK: - User
struct User: Codable {
    var email, id, token, createdAt: String?
    var updatedAt: String?
}

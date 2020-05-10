//
//  Feed.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import Foundation

// MARK: - Feed
struct Feed: Codable {
    var category: String?
    var dogImages: [String]?
    
    enum CodingKeys: String, CodingKey {
        case category
        case dogImages = "list"
    }
}

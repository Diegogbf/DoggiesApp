//
//  Encodable.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 09/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import Foundation

extension Encodable {
    
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
}

//
//  UITableView+Extensions.swift
//  HearthStone
//
//  Created by Diego Gomes on 29/04/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ cell: T.Type) where T:Reusable {
        register(cell.self, forCellReuseIdentifier: T.reuseId)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, indexPath: IndexPath) -> T where T:Reusable {
        let dequeuedCell = dequeueReusableCell(withIdentifier: cell.reuseId, for: indexPath)
        guard let reusableCell = dequeuedCell as? T else {
            fatalError("Failed to dequeue a cell with identifier \(cell.reuseId)")
        }
        
        return reusableCell
    }
}

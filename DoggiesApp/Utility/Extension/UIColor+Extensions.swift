//
//  UIColor+Extensions.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 12/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

extension UIColor {
    
     static func fromRGB(rgbValue: UInt) -> UIColor {
           return UIColor(
               red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
               green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
               blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
               alpha: CGFloat(1.0)
           )
       }
    
    static var mainColor: UIColor? {
        return UIColor.fromRGB(rgbValue: 0x044A57)
    }
}

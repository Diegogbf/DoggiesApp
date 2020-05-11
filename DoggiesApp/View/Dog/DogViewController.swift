//
//  DogViewController.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class DogViewController: CustomViewController<DogView> {
    
    convenience required init(imageUrl: String, category: String) {
        self.init()
        contentView.setImage(imageUrl: imageUrl)
        title = category
    }
}

//
//  DogPictureTableViewCell.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class DogPictureTableViewCell: UITableViewCell, Reusable {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    // MARK: Components
    private lazy var pictureImageView: UIImageView = {
        let pictureImageView = UIImageView()
        pictureImageView.contentMode = .scaleAspectFit
        pictureImageView.layer.cornerRadius = Layout.imageRadius
        pictureImageView.layer.borderColor = UIColor.white.cgColor
        pictureImageView.layer.borderWidth = Layout.imageBorderWidth
        return pictureImageView
    }()
    
    private enum Layout {
        static let imageRadius: CGFloat = 8
        static let imageBorderWidth: CGFloat = 2
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupLayout()
    }
    
    // MARK: Setup
    private func setupLayout() {
        contentView.addSubview(pictureImageView)
        pictureImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func set(image: String) {
        
    }
}

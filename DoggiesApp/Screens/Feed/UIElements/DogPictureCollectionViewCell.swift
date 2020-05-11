//
//  DogPictureTableViewCell.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class DogPictureCollectionViewCell: UICollectionViewCell, Reusable {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    // MARK: Components
    private lazy var pictureImageView: UIImageView = {
        let pictureImageView = UIImageView()
        pictureImageView.contentMode = .scaleToFill
        pictureImageView.layer.cornerRadius = Layout.imageRadius
        pictureImageView.clipsToBounds = true
        pictureImageView.backgroundColor = .lightGray
        return pictureImageView
    }()
    
    private enum Layout {
        static let imageRadius: CGFloat = 8
        static let imageBorderWidth: CGFloat = 2
        static let imageEdgesDistance: CGFloat = 8
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupLayout()
    }
    
    // MARK: Setup
    private func setupLayout() {
        contentView.addSubview(pictureImageView)
        pictureImageView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(Layout.imageEdgesDistance)
        }
    }
    
    func set(image: String) {
        pictureImageView.downloadImage(url: image)
    }
}

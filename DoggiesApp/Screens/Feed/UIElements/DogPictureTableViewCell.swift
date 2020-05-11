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
        pictureImageView.contentMode = .scaleToFill
        pictureImageView.layer.cornerRadius = Layout.imageRadius
        pictureImageView.layer.borderColor = UIColor.black.cgColor
        pictureImageView.layer.borderWidth = Layout.imageBorderWidth
        pictureImageView.clipsToBounds = true
        return pictureImageView
    }()
    
    private enum Layout {
        static let imageRadius: CGFloat = 8
        static let imageBorderWidth: CGFloat = 2
        static let imageEdgesDistance: CGFloat = 12
    }
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupLayout()
    }
    
    // MARK: Setup
    private func setupLayout() {
        contentView.addSubview(pictureImageView)
        pictureImageView.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview().inset(Layout.imageEdgesDistance)
            $0.bottom.equalToSuperview()
        }
    }
    
    func set(image: String) {
        pictureImageView.downloadImage(url: image)
    }
}

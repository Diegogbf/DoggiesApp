//
//  DogFilterCollectionViewCell.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class DogFilterCollectionViewCell: UICollectionViewCell, Reusable {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    // MARK: Components
    private lazy var containerView: UIView = {
        let containerView = UIView(frame: .zero)
        containerView.layer.cornerRadius = Layout.containerRadius
        return containerView
    }()
    
    private lazy var filterNameLabel: UILabel = {
        let filterNameLabel = UILabel(frame: .zero)
        return filterNameLabel
    }()
    
    private enum Layout {
        static let containerRadius: CGFloat = 8
        static let containerTrailingDistance: CGFloat = 16
        static let labelEdgesDistance: CGFloat = 16
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupLayout()
    }
    
    // MARK: Setup
    private func setupLayout() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(Layout.containerTrailingDistance)
        }
        
        containerView.addSubview(filterNameLabel)
        filterNameLabel.snp.makeConstraints {
            $0.edges.equalTo(Layout.labelEdgesDistance)
        }
    }
    
    func set(filterName: String) {
        filterNameLabel.text = filterName
    }
    
}

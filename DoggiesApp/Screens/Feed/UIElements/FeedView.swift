//
//  FeedView.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit
import SnapKit

class FeedView: UIView {
    
    // MARK: Components
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        if #available(iOS 10.0, *) {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        } 
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: Layout.collectionLeftInset, bottom: 0, right: 0)
        collectionView.backgroundColor = .white
        collectionView.register(DogFilterCollectionViewCell.self)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var tableView: CustomTableView = {
        let tableView = CustomTableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = Layout.tableViewRowHeight
        tableView.backgroundColor = .white
        tableView.register(DogPictureTableViewCell.self)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private enum Layout {
        static let collectionLeftInset: CGFloat = 16
        static let collectionHeight: CGFloat = 60
        static let tableViewRowHeight: CGFloat = 200
    }
    
    // MARK: Life Cycle
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupLayout()
    }
    
    // MARK: Setup
    private func setupLayout() {
        [collectionView, tableView].forEach { addSubview($0) }
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(Layout.collectionHeight)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}

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
    lazy var filterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        if #available(iOS 10.0, *) {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        } 
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: Layout.filterCollectionLeftInset, bottom: 0, right: 0)
        collectionView.backgroundColor = .white
        collectionView.register(DogFilterCollectionViewCell.self)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    lazy var dogsCollectionView: CustomCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = CustomCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(
            top: 0,
            left: Layout.dogsCollectionSideInset,
            bottom: 0,
            right: Layout.dogsCollectionSideInset
        )
        collectionView.backgroundColor = .white
        collectionView.register(DogPictureCollectionViewCell.self)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private enum Layout {
        static let filterCollectionLeftInset: CGFloat = 16
        static let filterCollectionHeight: CGFloat = 60
        static let dogsCollectionSideInset: CGFloat = 5
    }
    
    // MARK: Life Cycle
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupLayout()
    }
    
    // MARK: Setup
    private func setupLayout() {
        [filterCollectionView, dogsCollectionView].forEach { addSubview($0) }
        
        filterCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(Layout.filterCollectionHeight)
        }
        
        dogsCollectionView.snp.makeConstraints {
            $0.top.equalTo(filterCollectionView.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}

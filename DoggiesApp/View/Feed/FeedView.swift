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
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        if #available(iOS 10.0, *) {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        } 
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: Layout.collectionLeftInset, bottom: 0, right: 0)
        collectionView.backgroundColor = .white
        collectionView.register(DogFilterCollectionViewCell.self)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = Layout.tableViewRowHeight
        tableView.backgroundColor = .white
        tableView.register(DogPictureTableViewCell.self)
        return tableView
    }()
    
    var filterItens: [String] = []
    var dogsPictures: [String] = []
    
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

// MARK: UICollectionViewDelegate and UICollectionViewDataSource
extension FeedView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterItens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(DogFilterCollectionViewCell.self, indexPath: indexPath)
        cell.set(filterName: filterItens[indexPath.item])
        return cell
    }
}

// MARK: UITableViewDelegate and UITableViewDataSource
extension FeedView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogsPictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(DogPictureTableViewCell.self, indexPath: indexPath)
        cell.set(image: dogsPictures[indexPath.row])
        return cell
    }
}

//
//  SelectorCollectionView.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 11/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

protocol SelectorCollectionViewDelegate: class {
    func didSelectItem(at index: Int)
}

class SelectorCollectionView: UICollectionView {
    
    private var itens = [String]() {
        didSet {
            reloadData()
        }
    }
    private weak var selectorDelegate: SelectorCollectionViewDelegate?
    
    // MARK: Init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        if #available(iOS 10.0, *) {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum Layout {
        static let leftInset: CGFloat = 16
    }
    
    // MARK: setup
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        register(DogFilterCollectionViewCell.self)
        showsHorizontalScrollIndicator = false
        contentInset = UIEdgeInsets(top: 0, left: Layout.leftInset, bottom: 0, right: 0)
        delegate = self
        dataSource = self
    }
    
    func setup(itens: [String], selectorDelegate: SelectorCollectionViewDelegate) {
        self.itens = itens
        self.selectorDelegate = selectorDelegate
    }
}


// MARK: UICollectionViewDelegate and UICollectionViewDataSource
extension SelectorCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(DogFilterCollectionViewCell.self, indexPath: indexPath)
        cell.set(filterName: itens[indexPath.item].capitalized)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectorDelegate?.didSelectItem(at: indexPath.item)
    }
}

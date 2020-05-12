//
//  FeedViewController.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class FeedViewController: CustomViewController<FeedView> {
    
    // MARK: Variables
    private var viewModel: FeedViewModelType?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    convenience required init(viewModel: FeedViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    // MARK: Setup
    private func setup() {
        title = "DoggiesApp"
        viewModel?.delegate = self
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        contentView.dogsCollectionView.delegate = self
        contentView.dogsCollectionView.dataSource = self
        contentView.dogsCollectionView.pullToRefreshAction = { [weak self] in
            guard let self = self else { return }
            self.viewModel?.getFeed()
        }
        
        contentView.filterCollectionView.delegate = self
        contentView.filterCollectionView.dataSource = self
        selectFilter(at: 0)
    }
    
    private func selectFilter(at index: Int) {
        contentView.filterCollectionView.selectItem(
            at: IndexPath(item: index, section: 0),
            animated: true,
            scrollPosition: .left
        )
        viewModel?.set(currentCategory: index)
        contentView.dogsCollectionView.reloadData()
        viewModel?.getFeed()
    }
}

// MARK: FeedFeedBack
extension FeedViewController: FeedFeedBack {
    func loader(show: Bool) {
        contentView.dogsCollectionView.showLoader(show)
    }
    
    func succes() {
        contentView.dogsCollectionView.reloadData()
    }
    
    func showError(msg: String) {
        showErrorAlert(msg: msg)
    }
}

// MARK: UICollectionViewDelegate and UICollectionViewDataSource
extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let squareSide = UIScreen.main.bounds.width/CGFloat(2) - 10
        return CGSize(width: squareSide, height: squareSide)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == contentView.filterCollectionView {
            return viewModel?.filterOptions.count ?? 0
        } else {
            return viewModel?.currentFeed?.dogImages?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == contentView.filterCollectionView {
            let cell = collectionView.dequeueReusableCell(DogFilterCollectionViewCell.self, indexPath: indexPath)
            cell.set(filterName: viewModel?.filterOptions[indexPath.item].rawValue.capitalized ?? "")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(DogPictureCollectionViewCell.self, indexPath: indexPath)
            if let image = viewModel?.currentFeed?.dogImages?[indexPath.row] {
                cell.set(image: image)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == contentView.filterCollectionView {
            selectFilter(at: indexPath.item)
        } else {
            guard let imageUrl = viewModel?.currentFeed?.dogImages?[indexPath.row],
                let category = viewModel?.currentFeed?.category?.capitalized else { return }
            navigationController?.pushViewController(
                DogViewController(imageUrl: imageUrl, category: category),
                animated: true
            )
        }
    }
}

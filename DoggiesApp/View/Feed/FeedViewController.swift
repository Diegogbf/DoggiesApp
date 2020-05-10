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
    private lazy var viewModel: FeedViewModelType = FeedViewModel(delegate: self)
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        title = "DoggiesApp"
        setupDelegation()
    }
    
    private func setupDelegation() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
    }
}

// MARK: FeedFeedBack
extension FeedViewController: FeedFeedBack {
    func loader(show: Bool) {
        //Loader
    }
    
    func succes() {
        contentView.tableView.reloadData()
    }
    
    func showError(msg: String) {
        showErrorAlert(msg: msg)
    }
}

// MARK: UICollectionViewDelegate and UICollectionViewDataSource
extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filterOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(DogFilterCollectionViewCell.self, indexPath: indexPath)
        cell.set(filterName: viewModel.filterOptions[indexPath.item].rawValue.capitalized)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.currentFeed = Feed(category: viewModel.filterOptions[indexPath.item].rawValue)
        viewModel.getFeed()
    }
}

// MARK: UITableViewDelegate and UITableViewDataSource
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currentFeed?.dogImages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(DogPictureTableViewCell.self, indexPath: indexPath)
        if let image = viewModel.currentFeed?.dogImages?[indexPath.row] {
            cell.set(image: image)
        }
        return cell
    }
}

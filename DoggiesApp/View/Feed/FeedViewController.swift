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
        setupTableView()
        setupCollectionView()
    }
    
    private func setupTableView() {
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.tableView.pullToRefreshAction = { [weak self] in
            guard let self = self else { return }
            self.viewModel.getFeed()
        }
    }
    
    private func setupCollectionView() {
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
        selectFilter(at: 0)
    }
    
    private func selectFilter(at index: Int) {
        contentView.collectionView.selectItem(
            at: IndexPath(item: index, section: 0),
            animated: true,
            scrollPosition: .left
        )
        viewModel.currentFeed = Feed(category: viewModel.filterOptions[index].rawValue)
        contentView.tableView.reloadData()
        viewModel.getFeed()
    }
}

// MARK: FeedFeedBack
extension FeedViewController: FeedFeedBack {
    func loader(show: Bool) {
        contentView.tableView.showLoader(show)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectFilter(at: indexPath.item)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let imageUrl = viewModel.currentFeed?.dogImages?[indexPath.row],
            let category = viewModel.currentFeed?.category?.capitalized else { return }
        navigationController?.pushViewController(
            DogViewController(imageUrl: imageUrl, category: category),
            animated: true
        )
    }
}

//
//  FeedViewModel.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import Foundation

protocol FeedFeedBack: class {
    func loader(show: Bool)
    func succes()
    func showError(msg: String)
}

enum FilterOptions: String {
    case husky
    case hound
    case pug
    case labrador
}

protocol FeedViewModelType {
    var filterOptions: [FilterOptions] { get }
    var currentFeed: Feed? { get set }
    var delegate: FeedFeedBack? { get set }
    func getFeed()
    func set(currentCategory index: Int)
    init(repository: FeedRepositoryFactory, filterOptions: [FilterOptions])
}

final class FeedViewModel: FeedViewModelType {
    
    // MARK: Variables
    var currentFeed: Feed?
    var filterOptions: [FilterOptions] = [.husky, .hound, .pug, .labrador]
    weak var delegate: FeedFeedBack?
    private var repository: FeedRepositoryFactory?
    private var currentCategory: FilterOptions = .husky
    
    // MARK: Init
    init(repository: FeedRepositoryFactory, filterOptions: [FilterOptions]) {
        self.repository = repository
        self.filterOptions = filterOptions
    }
    
    // MARK: Api Request
    func getFeed() {
        delegate?.loader(show: true)
        repository?.getFeed(
            category: currentCategory,
            onSuccess: { [weak self] (feed: Feed) in
                guard let self = self else { return }
                self.delegate?.loader(show: false)
                self.currentFeed = feed
                self.delegate?.succes()
            }, onError: { [weak self] errorMsg in
                guard let self = self else { return }
                self.delegate?.loader(show: false)
                self.delegate?.showError(msg: errorMsg)
            }
        )
    }
    
    func set(currentCategory index: Int) {
        if !filterOptions.isEmpty {
            currentCategory = filterOptions[index]
        }
    }
}

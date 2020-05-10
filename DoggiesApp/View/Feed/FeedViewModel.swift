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
    var currentFeed: Feed? { get set }
    var filterOptions: [FilterOptions] { get }
    func getFeed()
    init(delegate: FeedFeedBack)
}

final class FeedViewModel: FeedViewModelType {
    var currentFeed: Feed?
    var filterOptions: [FilterOptions] = [.husky, .hound, .pug, .labrador]
    private weak var delegate: FeedFeedBack?
    
    init(delegate: FeedFeedBack) {
        self.delegate = delegate
    }
    
    func getFeed() {
        delegate?.loader(show: true)
        ServiceLayer.request(
            route: Router.getFeed(request: Feed(category: currentFeed?.category)),
            onSuccess: { [weak self] (feed: Feed) in
                guard let self = self else { return }
                self.delegate?.loader(show: false)
                self.currentFeed = feed
                self.delegate?.succes()
            },
            onError: { [weak self] errorMsg in
                guard let self = self else { return }
                self.delegate?.loader(show: false)
                self.delegate?.showError(msg: errorMsg)
            }
        )
    }
}

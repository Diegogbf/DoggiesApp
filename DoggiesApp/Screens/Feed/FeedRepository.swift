//
//  FeedRepository.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 11/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import Foundation

protocol FeedRepositoryFactory {
    func getFeed(category: FilterOptions, onSuccess: ((Feed) -> Void)?, onError: ((String) -> Void)?)
}

class FeedRepository: FeedRepositoryFactory {
    
    func getFeed(category: FilterOptions, onSuccess: ((Feed) -> Void)?, onError: ((String) -> Void)?) {
        ServiceLayer.request(
            route: Router.getFeed(request: Feed(category: category.rawValue)),
            onSuccess: { (feed: Feed) in
                onSuccess?(feed)
            },
            onError: { errorMsg in
                onError?(errorMsg)
            }
        )
    }
    
}

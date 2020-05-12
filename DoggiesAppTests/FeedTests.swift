//
//  FeedTests.swift
//  DoggiesAppTests
//
//  Created by Diego Gomes on 11/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import XCTest
@testable import DoggiesApp

class FeedTests: XCTestCase {
    
    func testFilterCollectionCell() {
        //Empty options
        XCTAssertEqual(createFeed().contentView.filterCollectionView.numberOfItems(inSection: 0), 0)
        
        //3 options
        XCTAssertEqual(createFeed(withFilter: [.husky, .hound, .labrador]).contentView.filterCollectionView.numberOfItems(inSection: 0), 3)
        
        //Making sure that cell is properly registered
        let _ = createFeed().contentView.filterCollectionView.dequeueReusableCell(
            DogFilterCollectionViewCell.self,
            indexPath: IndexPath(item: 0, section: 0)
        )
    }
    
    func testDogsCollectionCell() {
        //Empty List
        XCTAssertEqual(createFeed(withFilter: [.husky], resultForRequest: Feed()).contentView.dogsCollectionView.numberOfItems(inSection: 0), 0)
        
        //3 items
        let response = Feed(category: "mock", dogImages: ["", "", ""])
        XCTAssertEqual(createFeed(withFilter: [.husky], resultForRequest: response).contentView.dogsCollectionView.numberOfItems(inSection: 0), 3)
        
        //Making sure that cell is properly registered
        let _ = createFeed().contentView.dogsCollectionView.dequeueReusableCell(
            DogPictureCollectionViewCell.self,
            indexPath: IndexPath(item: 0, section: 0)
        )
    }
    
    func createFeed(withFilter options: [FilterOptions] = [], resultForRequest: Feed = Feed()) -> FeedViewController {
        let feedVc = FeedViewController(
            viewModel: FeedViewModel(
                repository: FeedRepositoryStub(stubResponse: resultForRequest),
                filterOptions: options
            )
        )
        feedVc.loadViewIfNeeded()
        return feedVc
    }
    
    class FeedRepositoryStub: FeedRepositoryFactory {
        let response: Feed
        
        init(stubResponse: Feed) {
            response = stubResponse
        }
        
        func getFeed(category: FilterOptions, onSuccess: ((Feed) -> Void)?, onError: ((String) -> Void)?) {
            onSuccess?(response)
        }
    }
}

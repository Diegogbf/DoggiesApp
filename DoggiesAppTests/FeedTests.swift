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
        let feedVc = FeedViewController()
        feedVc.loadViewIfNeeded()
        
        XCTAssertEqual(feedVc.contentView.filterCollectionView.numberOfItems(inSection: 0), 4)
        
        //Making sure that cell is properly registered
        let _ = feedVc.contentView.filterCollectionView.dequeueReusableCell(
            DogFilterCollectionViewCell.self,
            indexPath: IndexPath(item: 0, section: 0)
        )
    }
    
    func testDogsCollectionCell() {
        let feedVc = FeedViewController()
        feedVc.loadViewIfNeeded()
        
        XCTAssertEqual(feedVc.contentView.dogsCollectionView.numberOfItems(inSection: 0), 0)
        
        //Making sure that cell is properly registered
        let _ = feedVc.contentView.dogsCollectionView.dequeueReusableCell(
            DogPictureCollectionViewCell.self,
            indexPath: IndexPath(item: 0, section: 0)
        )
    }
}

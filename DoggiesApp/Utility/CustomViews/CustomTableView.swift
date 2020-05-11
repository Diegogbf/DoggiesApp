//
//  CustomTableView.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class CustomCollectionView: UICollectionView {
    
    // MARK: - Variables
    private lazy var pullToRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(pullToRefresh),
                                 for: .valueChanged)
        refreshControl.tintColor = .black
        return refreshControl
    }()
    
    var pullToRefreshAction: (()->())? {
        didSet {
            if pullToRefreshAction != nil {
                if #available(iOS 10.0, *) {
                    refreshControl = pullToRefreshControl
                }
            }
        }
    }
    
    @objc private func pullToRefresh() {
        pullToRefreshAction?()
    }
    
    func showLoader(_ show: Bool) {
        DispatchQueue.main.async {
            show ? self.pullToRefreshControl.beginRefreshing() : self.pullToRefreshControl.endRefreshing()
        }
    }
}

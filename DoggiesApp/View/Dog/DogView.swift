//
//  DogView.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class DogView: UIView {
    
    // MARK: Components
    private lazy var pictureImageView: UIImageView = {
        let pictureImageView = UIImageView()
        pictureImageView.contentMode = .scaleAspectFit
        return pictureImageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        return scrollView
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupLayout()
        setupZooming()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .white
    }
    
    // MARK: Setup
    private func setupLayout() {
        addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(pictureImageView)
        pictureImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.height.equalToSuperview()
        }
    }
    
    private func setupZooming() {
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        scrollView.delegate = self
    }
    
    func setImage(imageUrl: String) {
        pictureImageView.downloadImage(url: imageUrl)
    }
}

extension DogView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return pictureImageView
    }
}

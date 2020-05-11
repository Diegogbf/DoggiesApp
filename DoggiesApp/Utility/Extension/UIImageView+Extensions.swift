//
//  UIImageView+Extensions.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

extension UIImageView {
    private func getImagetData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(url: String?) {
        image = nil
        if let stringUrl = url, let url = URL(string: stringUrl) {
            if let cachedImage = ImageCache.shared[url] {
                image = cachedImage
            } else {
                getImagetData(from: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async() { [weak self] in
                        guard let self = self else { return }
                        let apiImage = UIImage(data: data)
                        ImageCache.shared[url] = apiImage
                        self.image = apiImage
                    }
                }
            }
        }
    }
}

//
//  ImageCache.swift
//  DoggiesApp
//
//  Created by Diego Gomes on 10/05/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

final class ImageCache {

    // MARK: Variables
    private lazy var imageCache: NSCache<AnyObject, AnyObject> = {
        let cache = NSCache<AnyObject, AnyObject>()
        cache.countLimit = config.countLimit
        cache.totalCostLimit = config.memoryLimit
        return cache
    }()
    static let shared = ImageCache()
    private let lock = NSLock()
    private let config: Config

    struct Config {
        let countLimit: Int
        let memoryLimit: Int
        static let defaultConfig = Config(countLimit: 100, memoryLimit: 1024 * 1024 * 100) // 100 MB
    }

    // MARK: Init
    init(config: Config = Config.defaultConfig) {
        self.config = config
    }

    // MARK: Handling Image Cache
    func insertImage(_ image: UIImage?, for url: URL) {
        guard let image = image else { return }
        lock.lock()
        defer {
            lock.unlock()
        }
        imageCache.setObject(image, forKey: url as AnyObject)
    }
    
    func image(for url: URL) -> UIImage? {
        lock.lock()
        defer {
            lock.unlock()
        }
        if let image = imageCache.object(forKey: url as AnyObject) as? UIImage {
            return image
        }
        return nil
    }
}

extension ImageCache {
    subscript(_ key: URL) -> UIImage? {
        get {
            return image(for: key)
        }
        set {
            return insertImage(newValue, for: key)
        }
    }
}

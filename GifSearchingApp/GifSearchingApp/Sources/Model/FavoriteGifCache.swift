//
//  FavoriteGifCache.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/23.
//  Copyright © 2020 조윤영. All rights reserved.
//

import Foundation
struct FavoriteGifCache {
    static let key = "fatorites"
    static func save(value: Dictionary<String, GifInfo>) {
         UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: key)
    }
    
    static func get() -> Dictionary<String, GifInfo>! {
        var userData: Dictionary<String, GifInfo>!
        if let data = UserDefaults.standard.value(forKey: key) as? Data {
            userData = try? PropertyListDecoder().decode(Dictionary<String, GifInfo>.self, from: data)
            return userData!
        } else {
            return userData
        }
    }
    
    static func remove() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

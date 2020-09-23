//
//  ModalVC + myFavoriteListManage.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/23.
//  Copyright © 2020 조윤영. All rights reserved.
//

import Foundation
import UIKit

extension ModalVC {
    func initStarImage() {
        if let _ = FavoriteGifCache.get()[gifId] {
            isMyFavorite = true
            self.starImageView.image = UIImage(named: "star_fill")
        } else {
            isMyFavorite = false
            self.starImageView.image = UIImage(named: "star_empty")
        }
    }
    
    func addToMyFavoriteList() {
        if var favoriteList = FavoriteGifCache.get() {
            print("!!!!")
            print(favoriteList.count)
            if(!checkFavoriteListSizeIsFull(favoriteList.count)) {
                favoriteList.updateValue(GifInfo(title: self.gifTitle, url: self.gifImageURL!, id: self.gifId), forKey: gifId)
                FavoriteGifCache.save(value: favoriteList)
                printFavoriteGifList(favoriteList)
                toggleStarImage()
            }
        }
    }
    
    func removeFromMyFavoriteList() {
        if var favoriteList = FavoriteGifCache.get()  {
            favoriteList.removeValue(forKey: gifId)
            FavoriteGifCache.save(value: favoriteList)
            printFavoriteGifList(favoriteList)
            toggleStarImage()
        }
    }
    
    func printFavoriteGifList(_ list: Dictionary<String,GifInfo>) {
        print("================")
        print(list.count)
        
        for gif in list {
            print(gif.value.title)
        }
        print("================")
    }
    
    func checkFavoriteListSizeIsFull(_ listSize: Int) -> Bool {
        if listSize == 20 {
            simpleAlert(title: "즐겨찾기 불가", message: "즐겨찾기는 최대 20개까지 가능합니다!")
            return true
        }
        return false
    }
    
    func toggleStarImage() {
        print(isMyFavorite)
        if isMyFavorite {
            self.starImageView.image = UIImage(named: "star_empty")
        } else {
            self.starImageView.image = UIImage(named: "star_fill")
        }
        isMyFavorite = !isMyFavorite
    }
}

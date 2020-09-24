//
//  FavoriteVC.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/23.
//  Copyright © 2020 조윤영. All rights reserved.
//

import UIKit

class FavoriteVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noDataLabel: UILabel!
    
    let cellIdentifier = "favoriteCell"
    var favoriteGifInfoList:[FavoriteGifInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initializeFavoriteGifInfoList()
        collectionView.reloadData()
    }
    
    func initializeFavoriteGifInfoList() {
        if(checkIsListEmpty()) {
            self.noDataLabel.alpha = 1
            return
        }
        else {
             self.noDataLabel.alpha = 0
        }
        
        favoriteGifInfoList.removeAll()
        for (_, value) in FavoriteGifCache.get() {
            favoriteGifInfoList.append(value)
        }
        favoriteGifInfoList.sort(by: {$0.createdAt > $1.createdAt})
    }
    
    func checkIsListEmpty() -> Bool {
        if FavoriteGifCache.get()?.count == 0 {
            return true
        }
        return false
    }
}

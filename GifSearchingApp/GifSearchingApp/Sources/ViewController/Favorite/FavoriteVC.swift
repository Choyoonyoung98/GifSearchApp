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
    
    let cellIdentifier = "favoriteCell"
    var favoriteGifInfoList:[GifInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initializeFavoriteGifInfoList()
        collectionView.reloadData()
    }
    
    func initializeFavoriteGifInfoList() {
        favoriteGifInfoList.removeAll()
        print("=================================")
        for (key, value) in FavoriteGifCache.get() {
            favoriteGifInfoList.append(value)
            print(value.title)
        }
        print(favoriteGifInfoList.count)
        print("=================================")
    }
}

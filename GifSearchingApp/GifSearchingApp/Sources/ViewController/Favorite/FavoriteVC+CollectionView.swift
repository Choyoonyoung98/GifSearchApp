//
//  FavoriteVC+CollectionView.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/24.
//  Copyright © 2020 조윤영. All rights reserved.
//
import UIKit
extension FavoriteVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FavoriteGifCache.get().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier2, for: indexPath) as? FavoriteCVCell {
            if indexPath.row < FavoriteGifCache.get().count {
                let url = favoriteGifInfoList[indexPath.row].url
                print(url)
                cell.imageView.kf.setImage(with: url)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let _: FavoriteCVCell = collectionView.cellForItem(at: indexPath) as? FavoriteCVCell {
            if let dvc = self.storyboard?.instantiateViewController(withIdentifier: "ModalVC") as? ModalVC {
                dvc.gifId = favoriteGifInfoList[indexPath.row].id
                dvc.gifTitle = favoriteGifInfoList[indexPath.row].title
                dvc.gifImageURL = favoriteGifInfoList[indexPath.row].url
                dvc.source = "FavoriteVC"
                self.present(dvc, animated: true, completion: nil)
            }
        }
    }
}

extension FavoriteVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interval = self.collectionView.frame.width / 30
        let cellWidth = (self.collectionView.frame.width - interval*4) / 3
        let cellHeight = cellWidth

        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let interval = self.collectionView.frame.width / 30
        return UIEdgeInsets(top: interval*3, left: interval, bottom: 0, right: interval)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let interval = self.collectionView.frame.width / 35
        return interval
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let interval = self.collectionView.frame.width / 35
        return interval
    }
}

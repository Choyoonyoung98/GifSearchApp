//
//  SearchVC + CollectionView.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/21.
//  Copyright © 2020 조윤영. All rights reserved.
//

import UIKit
import Kingfisher

extension SearchVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gifDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? GifCVCell
            if indexPath.row < gifDataList.count {
                let url = gifDataList[indexPath.row].url
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        cell?.imageView.kf.setImage(with: url)
                    }
                }
                if let gifId = Int(gifDataList[indexPath.row].id) {
                    cell?.tag = gifId
                }
            }
        return cell!
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let _: GifCVCell = collectionView.cellForItem(at: indexPath) as? GifCVCell {
            if let dvc = self.storyboard?.instantiateViewController(withIdentifier: "ModalVC") as? ModalVC {
                dvc.gifId = gifDataList[indexPath.row].id
                dvc.gifTitle = gifDataList[indexPath.row].title
                dvc.gifImageURL = gifDataList[indexPath.row].url
                dvc.source = "SearchVC"
                print(indexPath.row)
                self.present(dvc, animated: true, completion: nil)
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.searchTextField.resignFirstResponder()
    }
    
    //TODO: 무한스크롤
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.collectionView.window == nil {
            return
        }
        let offsetTolerance = CGFloat(30)
        
        let offsetY = collectionView.contentOffset.y
        let contentHeight = collectionView.contentSize.height
        
        if offsetY > contentHeight - (collectionView.bounds.size.height  + offsetTolerance), !scrollViewReachedBottom {
            self.scrollViewReachedBottom = true
            self.offset += 25
            getGifList(keyword: gsno(self.searchTextField.text), offset: offset)
        }
    }
}

extension SearchVC: UICollectionViewDelegateFlowLayout {
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

extension SearchVC: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if let cellToUpdate = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? GifCVCell {
                if indexPath.row < gifDataList.count {
                    let url = gifDataList[indexPath.row].url
                    DispatchQueue.global().async {
                        DispatchQueue.main.async {
                            cellToUpdate.imageView.kf.setImage(with: url)
                        }
                    }
                    if let gifId = Int(gifDataList[indexPath.row].id) {
                        cellToUpdate.tag = gifId
                    }
                }
            }
        }
    }
}

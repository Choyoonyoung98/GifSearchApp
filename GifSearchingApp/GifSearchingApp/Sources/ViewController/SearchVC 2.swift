//
//  SearchVC.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/21.
//  Copyright © 2020 조윤영. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var showMoreGifBtn: UIButton!
    
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func searchBtnTouchUpAction(_ sender: Any) {
        self.view.endEditing(true)
        //MARK: 검색 버튼 선택 시, 검색 시작
        postGifList(keyword: "", id: 0)
    }
    
    func setStyle() {
        self.searchView.circleRadius()
        self.showMoreGifBtn.alpha = 0
    }
}


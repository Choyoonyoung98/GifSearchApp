//
//  SearchVC.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/21.
//  Copyright © 2020 조윤영. All rights reserved.
//

import UIKit

struct GifInfo {
    var title: String
    var gifURL: URL
    var id: String
}
class SearchVC: UIViewController {
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var showMoreGifBtn: UIButton!
    
    let cellIdentifier = "cell"
    var gifURLList: [GifInfo] = []
    var offset = 0
    var scrollViewReachedBottom: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchTextField.text = ""
        self.offset = 0
        self.gifURLList = []
        setStyle()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func searchBtnTouchUpAction(_ sender: Any) {
        self.view.endEditing(true)
        //MARK: 검색 버튼 선택 시, 검색 시작
        self.gifURLList.removeAll()
        self.offset = 0
        self.getGifList(keyword: gsno(self.searchTextField.text), offset: offset)
    }
    
    @IBAction func searchMoreBtnTouchUpAction(_ sender: Any) {
        self.offset += 25;
        self.getGifList(keyword: self.gsno(self.searchTextField.text), offset: self.offset)
        self.showMoreGifBtn.alpha = 0
        self.showMoreGifBtn.isEnabled = false
    }
    
    
    func setStyle() {
        self.searchView.circleRadius()
        self.showMoreGifBtn.alpha = 0
        self.showMoreGifBtn.isEnabled = false
    }
}


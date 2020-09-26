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
    
    let cellIdentifier = "cell"
    var gifDataList: [GifInfo] = []
    var offset = 0
    var scrollViewReachedBottom: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        getTrendList(keyword: gsno(self.searchTextField.text), offset: offset)
        self.collectionView.reloadData()
        setStyle()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setStyle() {
        self.searchView.circleRadius()
    }
}


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
        
    }
    
    func setStyle() {
        searchView.circleRadius()
    }
}

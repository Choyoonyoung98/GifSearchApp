//
//  SearchVC+Textfield.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/21.
//  Copyright © 2020 조윤영. All rights reserved.
//

import UIKit

extension SearchVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.searchTextField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchTextField.resignFirstResponder()
        self.gifDataList.removeAll()
        offset = 0
        getGifList(keyword: gsno(self.searchTextField.text), offset: offset)
        //MARK: 엔터 선택 시, 검색 시작
        return true
    }
}

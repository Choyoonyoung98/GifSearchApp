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
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.gifDataList.removeAll()
        offset = 0
        if(searchTextField.text != "") {
            getGifList(keyword: gsno(self.searchTextField.text), offset: offset)
        } else {
            getTrendList(keyword: gsno(self.searchTextField.text), offset: offset)
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.searchTextField.resignFirstResponder()
        return true
    }
}

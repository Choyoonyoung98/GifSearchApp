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
        return true
    }
}

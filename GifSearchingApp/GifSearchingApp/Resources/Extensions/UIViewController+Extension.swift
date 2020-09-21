//
//  UIViewController+Extension.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/22.
//  Copyright © 2020 조윤영. All rights reserved.
//

import UIKit

extension UIViewController {
    func gono(_ value: Any?) -> Any {
        if let _value = value {
            return _value
        }else {
            return []
        }
    }
    func gsno(_ value : String?) -> String{
        if let _value = value{
            return _value
        }else{
            return ""
        }
    }
    func gino(_ value : Int?) -> Int{
        if let _value = value{
            return _value
        }else{
            return -1
        }
    }
    func gfno(_ value : Float?) -> Float{
        if let _value = value{
            return _value
        }else{
            return -1.0
        }
    }
    func gdno(_ value : Double?) -> Double{
        if let _value = value{
            return _value
        }else{
            return -1.0
        }
    }
    func gbno(_ value : Bool?) -> Bool {
        if let _value = value {
            return _value
        }else {
            return false
        }
    }
    
    //네트워크 에러 팝업
    func networkErrorAlert() {
        let alert = UIAlertController(title: "네트워크 오류", message: "잠시 후에 다시 시도해주세요!", preferredStyle: .alert)
        alert.view.tintColor = UIColor.red
        let okAction = UIAlertAction(title: "확인",style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

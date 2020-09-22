//
//  UIView+Extension.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/21.
//  Copyright © 2020 조윤영. All rights reserved.
//

import UIKit
extension UIView {
    
    func circleRadius(){
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
    }
}

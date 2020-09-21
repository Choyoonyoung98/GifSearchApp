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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
    }
    
    func setStyle() {
        searchView.circleRadius()
    }
}

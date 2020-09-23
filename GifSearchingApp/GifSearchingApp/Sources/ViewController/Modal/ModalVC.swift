//
//  ModalVC.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/23.
//  Copyright © 2020 조윤영. All rights reserved.
//

import UIKit

class ModalVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shareBtn: UIButton!
    
    var gifId: String = ""
    var gifTitle: String = ""
    var gifImageURL: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = try? Data(contentsOf: gifImageURL!) {
            self.imageView.image = UIImage(data: data)
        }
        self.titleLabel.text = gifTitle
        
        setStyle()
    }
    
    func setStyle() {
        self.imageView.roundRadius(radius: 18)
        self.shareBtn.roundRadius(radius: 12)
    }
    
    @IBAction func shareTouchUpAction(_ sender: Any) {
        
    }
}

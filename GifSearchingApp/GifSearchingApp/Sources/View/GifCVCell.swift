//
//  GifCVCell.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/21.
//  Copyright © 2020 조윤영. All rights reserved.
//

import UIKit

class GifCVCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.black
        self.roundRadius(radius: 18)
        
    }
}

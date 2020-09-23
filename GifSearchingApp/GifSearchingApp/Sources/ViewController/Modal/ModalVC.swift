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
    @IBOutlet weak var starImageView: UIImageView!
    
    var gifId: String = ""
    var gifTitle: String = ""
    var gifImageURL: URL?
    var isMyFavorite: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = try? Data(contentsOf: gifImageURL!) {
            self.imageView.image = UIImage(data: data)
        }
        self.titleLabel.text = gifTitle
        
        initStarImage()
        setStyle()
    }
    
    func setStyle() {
        self.shareBtn.roundRadius(radius: 12)
    }
    
    @IBAction func addToMyFavoriteTouchUpAction(_ sender: Any) {
        if(!isMyFavorite) {
            print("add")
            addToMyFavoriteList()
        } else {
            print("remove")
            removeFromMyFavoriteList()
        }
    }
    
    @IBAction func shareTouchUpAction(_ sender: Any) {
        let title = self.titleLabel.text
        let image = self.imageView.image
        
        let shareAll: [Any] = [title, image]
        
        let activityViewController = UIActivityViewController(activityItems: shareAll , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view

        self.present(activityViewController, animated: true, completion: nil)
    }
}

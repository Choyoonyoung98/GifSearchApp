//
//  FavoriteGifInfo.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/24.
//  Copyright © 2020 조윤영. All rights reserved.
//

import Foundation

struct FavoriteGifInfo: Codable {
    var title: String
    var url: URL
    var id: String
    var createdAt: Date //즐겨찾기에 추가한 날짜 및 시간 
}

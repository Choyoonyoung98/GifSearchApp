//
//  GifTrendModel.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/26.
//  Copyright © 2020 조윤영. All rights reserved.
//

import Foundation
class GifTrendModel: Codable {
    var data: [DataModel]?
    var meta: MetaModel?
    var pagination: PaginationModel?
}

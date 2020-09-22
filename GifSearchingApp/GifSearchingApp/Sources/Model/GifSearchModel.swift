//
//  GifListModel.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/22.
//  Copyright © 2020 조윤영. All rights reserved.
//

import Foundation
class GifSearchModel: Codable {
    var data: GifModel?
    var pagination: PaginationModel?
    var meta: MetaModel?
}

class GifModel: Codable {
    var type: String?
    var id: String?
    var slug: String?
    var url: String?
    var bitly_url: String?
    var embed_url: String?
    var username: String?
    var source: String?
    var rating: String?
    var content_url: String?
    var user: User?
    var source_tld: String?
    var source_post_url: String?
    var update_datetime: String?
    var create_datetime: String?
    var import_datetime: String?
    var trending_datetime: String?
    var images: Images?
    var title: String?
}

class User: Codable {
    var avatar_url: String?
    var banner_url: String?
    var profile_url: String?
    var username: String?
    var display_name: String?
}

class Images: Codable {
    var url: String?
    var width: String?
    var height: String?
    var size: String?
    var mp4: String?
    var mp4_size: String?
    var webp: String?
    var webp_size: String?
}

class PaginationModel: Codable {
    var offset: Int?
    var total_count: Int?
    var count: Int?
}

class MetaModel: Codable {
    var msg: String?
    var status: Int?
    var response_id: String?
}

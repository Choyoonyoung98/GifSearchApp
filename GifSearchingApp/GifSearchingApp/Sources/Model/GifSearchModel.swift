//
//  GifListModel.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/22.
//  Copyright © 2020 조윤영. All rights reserved.
//

import Foundation
class GifSearchModel: Codable {
    var data: [DataModel]?
    var meta: MetaModel?
    var pagination: PaginationModel?
}

class DataModel: Codable {
    var slug: String?
    var bitly_gif_url: String?
    var title: String?
    var source: String?
    var tags: [String]?
    var is_sticker: Int?
    var rating: String?
    var analytics: AnalayticsModel?
    
    var type: String?
    var import_datetime: String?
    var url: String?
    var analytics_response_payload: String?
    var username: String?
    var featured_tags: [String]?
    var bitly_url: String?
    var id: String?
    var embed_url: String?
    var trending_datetime: String?
    var source_post_url: String?
    var source_tld: String?
    var user_tags: [String]?
    var content_url: String?
}

class AnalayticsModel: Codable {
    var onClick: URLModel?
    var onsent: URLModel?
    var onload: URLModel?
}

class URLModel: Codable {
    var url: String?
}

class User: Codable {
    var avatar_url: String?
    var banner_url: String?
    var profile_url: String?
    var username: String?
    var display_name: String?
}

class MetaModel: Codable {
    var msg: String?
    var status: Int?
    var response_id: String?
}

class PaginationModel: Codable {
    var offset: Int?
    var total_count: Int?
    var count: Int?
}


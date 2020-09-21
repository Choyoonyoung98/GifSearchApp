//
//  APIService.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/22.
//  Copyright © 2020 조윤영. All rights reserved.
//
protocol APIService {
    
}

extension APIService {
    func url(_ path: String) -> String {
        return "api.giphy.com/v1" + path
    }
}

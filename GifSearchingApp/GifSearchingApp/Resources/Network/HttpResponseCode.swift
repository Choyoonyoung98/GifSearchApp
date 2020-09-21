//
//  HttpResponseCode.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/22.
//  Copyright © 2020 조윤영. All rights reserved.
//

import Foundation

//service manager layer status
enum HttpResponseCode: Int {
    case getSuccess = 200
    case badRequest = 400
    case forbidden = 403
    case notFound = 404
    case tooManyRequest = 429
}

//Access API status
enum Result<T> {
    case success(T)
    case error(String)
    case failure(Error)
}

//middle layer status
enum NetworkResult<T> {
    case networkSuccess(T) //200
    case badRequest
    case forBidden
    case notFound
    case tooManyRequest
}

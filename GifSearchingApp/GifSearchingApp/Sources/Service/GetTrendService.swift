//
//  GetTrendService.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/26.
//  Copyright © 2020 조윤영. All rights reserved.
//

import Foundation
struct GetGifTrendService: GetService, APIService {
    typealias NetworkData = GifTrendModel
    static let sharedInstance = GetGifTrendService()
    
    //MARK: GET - https://api.giphy.com/v1/gifs/trending (Gif 트렌드 검색 API)
    func getTrendList(params:[String:Any], completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let gifSearchURL = self.url("/gifs/trending")
        
        gettable(GifTrendModel(), gifSearchURL, params: params) { (result) in
            switch result {
            case .success(let networkResult):
                switch networkResult.resCode {
                case HttpResponseCode.getSuccess.rawValue: //200
                    completion(.networkSuccess(networkResult.resResult))
                    break
                case HttpResponseCode.badRequest.rawValue: //400
                    completion(.badRequest)
                    break
                case HttpResponseCode.forbidden.rawValue: //403
                    completion(.forBidden)
                    break
                case HttpResponseCode.notFound.rawValue: //404
                    completion(.forBidden)
                    break
                case HttpResponseCode.tooManyRequest.rawValue: //429
                    completion(.tooManyRequest)
                    break
                default :
                    print("Exception: \(networkResult.resCode)")
                    break
                }
                break
                
            case .error(let resCode):
                switch resCode {
                case HttpResponseCode.serverErr.rawValue.description: //500
                    completion(.serverErr)
                    break
                case HttpResponseCode.maintainance.rawValue.description: //503
                    completion(.maintainance)
                    break
                default :
                    print("Error: \(resCode)")
                    break
                }
                break
                
            case .failure(_):
                completion(.networkFail)
                print("FAIL: Network Fail")
                break
            }
        }
    }
}

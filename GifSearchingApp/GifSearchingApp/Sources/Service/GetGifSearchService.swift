//
//  GetGifSearchService.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/22.
//  Copyright © 2020 조윤영. All rights reserved.
//
struct GetGifSearchService: GetService, APIService {
    typealias NetworkData = GifSearchModel
    static let sharedInstance = GetGifSearchService()
    
    //MARK: GET - https://api.giphy.com/v1/gifs/search (Gif 검색 API)
    func getGifList(params:[String:Any], completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let gifSearchURL = self.url("/gifs/search")
        
        gettable(GifSearchModel(), gifSearchURL, params: params) { (result) in
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

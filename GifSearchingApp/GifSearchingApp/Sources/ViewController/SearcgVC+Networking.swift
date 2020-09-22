//
//  SearcgVC+Networking.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/22.
//  Copyright © 2020 조윤영. All rights reserved.
//

import Foundation
extension SearchVC {
    func postGifList(keyword: String) {
        let params: [String: Any] = [
             "api_key": "EOxjg9RPBbUJQyzL8yag8Z8u6tN6zauH",
               "q": "banana",
               "limit": 25,
               "offset": 0
        ]
        GetGifSearchService.sharedInstance.getGifList(params: params) { (result) in
            switch result {
                case .networkSuccess(let data): //200
                    let gifData = data as? GifSearchModel
                    if let resResult = gifData {
                        //TODO: 데이터 뷰에 뿌려주기
                    }
                    break
                case .badRequest: //400
                    self.simpleAlert(title: "400 오류", message: "잠시 후에 다시 시도해주세요!")
                    break
                case .forBidden: //403
                    self.simpleAlert(title: "403 오류", message: "잠시 후에 다시 시도해주세요!")
                    break
                case .notFound: //404
                    self.simpleAlert(title: "404 오류", message: "잠시 후에 다시 시도해주세요!")
                    break
                case .tooManyRequest: //429
                    self.simpleAlert(title: "429 오류", message: "잠시 후에 다시 시도해주세요!")
                    break
                case .serverErr: //500
                    self.simpleAlert(title: "500 오류", message: "잠시 후에 다시 시도해주세요!")
                    break
                case .maintainance: //503
                    self.simpleAlert(title: "503 오류", message: "잠시 후에 다시 시도해주세요!")
                    break
                case .networkFail:
                    self.simpleAlert(title: "네트워크 오류", message: "잠시 후에 다시 시도해주세요!")
                    break
                default:
                    self.simpleAlert(title: "오류", message: "다시 시도해주세요!")
                break
            }
        }
    }
}

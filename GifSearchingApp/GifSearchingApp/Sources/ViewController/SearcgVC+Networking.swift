//
//  SearcgVC+Networking.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/22.
//  Copyright © 2020 조윤영. All rights reserved.
//

import Foundation
extension SearchVC {
    func getGifList(keyword: String, offset: Int) {
        let params: [String: Any] = [
             "api_key": "EOxjg9RPBbUJQyzL8yag8Z8u6tN6zauH",
               "q": keyword,
               "limit": 24,
               "offset": offset
        ]
        
        GetGifSearchService.sharedInstance.getGifList(params: params) { (result) in
            switch result {
                case .networkSuccess(let data): //200
                    let gifData = data as? GifSearchModel
                    if let resResult = gifData {
                        //TODO: 데이터 뷰에 뿌려주기
                        if let resultData = resResult.data {
                            for res in resultData {
                                let gifTitle = self.gsno(res.title)
                                let gifURL = URL(string: self.gsno(res.images?.fixed_width_small_still?.url))!
                                let gifId = self.gsno(res.id)
                                self.gifURLList.append(GifInfo(title: gifTitle, gifURL: gifURL, id: gifId))
                            }
                            for a in self.gifURLList {
                                print(a.title)
                            }
                            print(self.gifURLList.count)
                            
                            self.collectionView.reloadData()
                        }
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

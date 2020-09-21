//
//  PostService.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/22.
//  Copyright © 2020 조윤영. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol PostService {
    associatedtype NetworkData: Codable
    typealias networkResult = (resCode: Int, resResult: NetworkData)
    func post(_ URL: String, params: [String: Any], completion: @escaping (Result<networkResult>) -> Void)
}

extension PostService {
    func gino(_ value : Int?) -> Int {
        return value ?? 0
    }
    
    func post(_ URL: String, params: [String: Any], completion: @escaping (Result<networkResult>) -> Void) {
        guard let encodedURL = URL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("Networking - invalid URL")
            return
        }
        
        print("URL: \(encodedURL)")
        
        Alamofire.request(encodedURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: HTTPHeaders()).responseData { (res) in
            switch res.result {
            case .success:
                print("Networking Post Here")
                
                if let value = res.result.value {
                    let resCode = self.gino(res.response?.statusCode)
                    print("StatusCode: \(resCode)")
                    print(JSON(value))
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let resData = try decoder.decode(NetworkData.self, from: value)
                        let result: networkResult = (resCode, resData)
                        completion(.success(result))
                    } catch {
                        completion(.error("\(resCode)"))
                    }
                }
                break
                
            case .failure(let err):
                print(err.localizedDescription)
                completion(.failure(err))
               break
            }
        }
    }
}

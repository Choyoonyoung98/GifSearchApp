//
//  GetService.swift
//  GifSearchingApp
//
//  Created by 조윤영 on 2020/09/22.
//  Copyright © 2020 조윤영. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON

protocol GetService {
    associatedtype NetworkData : Codable
    typealias networkResult = (resCode: Int, resResult: NetworkData)
    func gettable(_ model:Codable, _ URL: String, params:[String: Any], method: HTTPMethod, completion: @escaping (Result<networkResult>) -> Void)
}

extension GetService {
    func gino(_ value : Int?) -> Int {
        return value ?? 0
    }
    
    func gettable(_ model:Codable, _ URL: String, params: [String: Any], method:HTTPMethod = .get, completion: @escaping (Result<networkResult>) -> Void) {
        guard let encodedUrl = URL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("Networking SUCCESS")
            return
        }
        print("URL: \(encodedUrl)")
        
        Alamofire.request(encodedUrl, method: method, parameters: params, headers: HTTPHeaders())
            .responseData {
                res in
                switch res.result {
                case .success:
                    if let value = res.result.value {
                        print("Networking Get Here!")
                        print(JSON(value))
                        
                        let resCode = self.gino(res.response?.statusCode)
                        print("상태코드: \(resCode)")
                        
                        let decoder = JSONDecoder()
                        do {
                            print(("[해당 API에 접근 성공]"))
                            let data = try decoder.decode(NetworkData.self, from: value)
                            
                            let result: networkResult = (resCode, data)
                            completion(.success(result))
                            
                        } catch (let error) {
                            print("catch GET: \(error.localizedDescription)")
                            completion(.error("\(resCode)"))
                        }
                    }
                    break
                case .failure(let error):
                    print("failure: \(error.localizedDescription)")
                    completion(.failure(error))
                    break
                }
        }
    }
}

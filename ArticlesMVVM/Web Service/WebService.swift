//
//  WebService.swift
//  ArticlesMVVM
//
//  Created by Neria Jerafi on 29/03/2021.
//

import Foundation
import Alamofire

enum WebServiceError:Error {
    case apiError
}

struct WebService {
    static func getRequest<T:Decodable>(stringURL:String = "https://cdn.theculturetrip.com/home-assignment/response.json",completion:@escaping(Result<T,WebServiceError>) ->()){
        guard let url = URL(string: stringURL) else { return }
        AF.request(url).response { (response) in
            if let data = response.data{
                do {
                    let decodeData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodeData))
                } catch  {
                    completion(.failure(.apiError))
                }
            }else{
                completion(.failure(.apiError))
            }
        }
    }
}

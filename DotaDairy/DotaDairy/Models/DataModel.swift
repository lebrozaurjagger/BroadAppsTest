//
//  DataModel.swift
//  DotaDairy
//
//  Created by Phillip on 26.06.2024.
//

import Foundation

struct ResponseModel: Codable {
    let expired: Int
    let theme: [String]
    let canDelete: [String]
    let deletable: Bool
    let isLeft: String
    let hasLink: Bool
    let materials: String
    let isForeign: Bool?
    let nonpastable: String
    let isTitlecase: String
    let past: Bool
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchResponse(completion: @escaping (Result<ResponseModel, Error>) -> Void) {
        guard let url = URL(string: "https://codegeniuslab.space/app/x1xb4tt") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 7
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "dataNilError", code: -100001, userInfo: nil)))
                return
            }
            
            do {
                let responseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
                completion(.success(responseModel))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }.resume()
    }
}

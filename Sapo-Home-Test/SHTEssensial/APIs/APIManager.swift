//
//  APIManager.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import Foundation

class APIManager {
    
    static let instance = APIManager()
    
    func getData<T>(type: T.Type, urlString: String, completion: @escaping (T?) -> ()) where T: Decodable {
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data else {
                return
            }
            print(data)
            let response = try? JSONDecoder().decode(T.self, from: data)
            completion(response)
            }).resume()
    }
}



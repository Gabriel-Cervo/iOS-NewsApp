//
//  Networking.swift
//  NewsApp
//
//  Created by Joao Gabriel Dourado Cervo on 11/07/21.
//

import Foundation

struct Networking {
    func getData<T: Decodable>(for urlString: String, completionHandler: @escaping (T) -> Void) {
        DispatchQueue.global().async {
            guard let url = URL(string: urlString) else {
                print("\(urlString) cannot be converted to URL type")
                return
            }
            
            var request = URLRequest(url: url)
            request.addValue(Constants.apiKey, forHTTPHeaderField: "x-api-key")
                    
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else { return }
                
                guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                    print("Data cannot be decoded: \(data). Showing response below:")
                    let json = try! JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    return
                }
                
                DispatchQueue.main.async {
                    completionHandler(decodedData)
                }
            }
            
            task.resume()
        }
    }
}

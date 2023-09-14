//
//  StockNetworkManager.swift
//  StockApp
//
//  Created by Ankit Sharma on 14/09/23.
//

import Foundation


struct StockNetworkManager {
    
    func getAllStocks(completion: @escaping (([Stock]?) -> ())) {
        
        let urlString = "https://fluoridated-checkered-song.glitch.me/stocks"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "error")
                completion(nil)
                return
            }
            
            //parsing JSON
            do {
                let stocks = try JSONDecoder().decode([Stock].self, from: data)
                completion(stocks)
            } catch let apiError {
                print(apiError.localizedDescription)
                completion(nil)
            }
        }.resume()
    }
}

//
//  Stock.swift
//  StockApp
//
//  Created by Ankit Sharma on 14/09/23.
//

import Foundation

struct Stock: Decodable, Hashable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}

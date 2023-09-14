//
//  StockListViewModel.swift
//  StockApp
//
//  Created by Ankit Sharma on 14/09/23.
//

import SwiftUI

class StockListViewModel: ObservableObject {
    
    @Published var stocks: [StockViewModel] = []
    @Published var searchTerm: String
    
    private let networkManager: StockNetworkManager!
    
    init() {
        searchTerm = ""
        networkManager = StockNetworkManager()
        fetchAllStocks()
    }
    
    
    private func fetchAllStocks() {
        networkManager.getAllStocks { [weak self] stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self?.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
}


struct StockViewModel {
    
    private let stock: Stock
    @UpperCase var symbol: String
    
    init(stock: Stock) {
        self.stock = stock
        self.symbol = stock.symbol
    }
    
    var description: String {
        stock.description
    }
    
    var price: String {
        String(format: "%.2f", stock.price)
    }
    var change: String {
        stock.change
    }
}

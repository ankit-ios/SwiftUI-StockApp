//
//  StockListView.swift
//  StockApp
//
//  Created by Ankit Sharma on 14/09/23.
//

import SwiftUI

struct StockListView: View {
    
    var stocks: [StockViewModel] = []
    
    init(stocks: [StockViewModel]) {
        self.stocks = stocks
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        List {
            ForEach(stocks, id: \.description) { stock in
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(stock.symbol)
                            .foregroundColor(.white)
                            .padding([.bottom], 2)
                            .fontWeight(.bold)
                            .font(.custom("Arial", size: 22))
                        Text(stock.description)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text(stock.price)
                            .foregroundColor(.white)
                            .padding([.bottom], 5)
                        Button(stock.change) {
                        }
                        .padding([.leading, .trailing], 10)
                        .font(.custom("Arial", size: 20))
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                .listRowBackground(Color.clear) //Removing background color from cell
            }
        }
        //setting background color for list view
        .background(.black)
        .scrollContentBackground(.hidden)
    }
}

struct StockList_Previews: PreviewProvider {
    static var previews: some View {
        StockListView(stocks: [.init(stock: Stock.init(symbol: "GOOG", description: "Google Innovation Media", price: 1000, change: "-0.24"))])
    }
}

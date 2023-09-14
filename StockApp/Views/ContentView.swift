//
//  ContentView.swift
//  StockApp
//
//  Created by Ankit Sharma on 14/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var stockListVM: StockListViewModel
    
    init() {
        self.stockListVM = StockListViewModel()
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .topLeading) {
                Color.black
                    .ignoresSafeArea()
                
                Text("September 14, 2023")
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .font(.custom("Arial", size: 32))
                    .padding([.leading], 20)
                
                SearchBarView(searchTerm: $stockListVM.searchTerm)
                    .offset(y: 40)
                
                StockListView(stocks: filteredStock())
                    .offset(y: 100)
            }
            .navigationTitle("Stocks")
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    //stock filtering
    private func filteredStock() -> [StockViewModel] {
        if stockListVM.searchTerm.isEmpty {
            return stockListVM.stocks
        } else {
            return stockListVM.stocks.filter { $0.symbol.starts(with: stockListVM.searchTerm.uppercased()) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

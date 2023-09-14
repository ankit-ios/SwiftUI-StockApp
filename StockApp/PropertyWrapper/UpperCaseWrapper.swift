//
//  UpperCaseWrapper.swift
//  StockApp
//
//  Created by Ankit Sharma on 14/09/23.
//

import SwiftUI

///Use this property wrapper when requirement is to get uppercased string
@propertyWrapper class UpperCase {
    
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }
}



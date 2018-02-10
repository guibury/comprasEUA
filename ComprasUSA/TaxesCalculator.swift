//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Guilherme Bury on 10/02/2018.
//  Copyright © 2018 Guilherme Bury. All rights reserved.
//

import Foundation

class TaxesCalculator {
    
    static let instance = TaxesCalculator()
    
    var dollar = 3.5
    var iof = 6.38
    var tax = 7.0
    var shoppingValue: Double = 0
    
    var formatter = NumberFormatter()
    
    var shoppingDolarReal: Double {
        return shoppingValue * dollar
    }
    
    var taxValue: Double {
        return shoppingValue * tax / 100
    }
    
    var iofValue: Double {
        return (shoppingValue + tax) * iof / 100
    }
    
    private init() {
        formatter.usesGroupingSeparator = true
    }
    
    func calculate(usingCreditCard: Bool) -> Double {
        var finalValue = shoppingValue + taxValue
        
        if usingCreditCard {
            finalValue += iofValue
        }
        return finalValue * dollar
    }
    
    func convertToDouble (_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
}

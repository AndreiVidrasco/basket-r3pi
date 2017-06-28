//
//  File.swift
//  Basket
//
//  Created by Andrei Vidrasco on 24/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import Foundation

struct Currency {
    let code: String
    let fullTitle: String
    let quoteToUSD: Double
}

extension Currency: Equatable {
    static func ==(lhs: Currency, rhs: Currency) -> Bool {
        return lhs.code == rhs.code && lhs.fullTitle == rhs.fullTitle && lhs.quoteToUSD == rhs.quoteToUSD
    }
    
    static var `default`: Currency = Currency(code: "USD", fullTitle: "United States Dollar", quoteToUSD: 1.0)
    
    func formattedPrice(with amountInUSD: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = code
        let amount = amountInUSD * quoteToUSD
        return formatter.string(from: NSNumber(value: amount))!
    }
    
    
    func formattedCellTitle(with amountInUSD: Double?) -> String {
        if let amountInUSD = amountInUSD {
            return "\(code) - \(fullTitle) - \(formattedPrice(with: amountInUSD))"
        }
        
        return "\(code) - \(fullTitle)"
    }
    
    
    static func parse(currencies: [String: String], exchangeRates: [String: Double]) -> [Currency] {
        return  currencies.flatMap({ element in
            Currency(code: element.key, fullTitle: element.value, quoteToUSD: exchangeRates["USD" + element.key]!)
        }).sorted {
            $0.code < $1.code
        }
    }
}


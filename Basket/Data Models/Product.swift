//
//  Product.swift
//  Basket
//
//  Created by Andrei Vidrasco on 28/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import Foundation

struct Product: Codable {
    let name: String
    let price: Double
    let unit: String
}

extension Product: Hashable {
    var hashValue: Int {
        return "\(name)\(price)\(unit)".hash
    }
    
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price && lhs.unit == rhs.unit
    }
    
    
    func formattedTitle(for count: Int, with currency: Currency) -> String {
        if count > 0 {
            return "\(count) \(unit)\(count == 1 ? "" : "s") of \(name) with \(currency.formattedPrice(with: price)) per \(unit)"
        }
        
        return "\(name) with \(currency.formattedPrice(with: price)) per \(unit)"
    }
}


//
//  Basket.swift
//  Basket
//
//  Created by Andrei Vidrasco on 23/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import Foundation

struct Basket {
    private var products: [Product: Int] = [:]
    
    mutating func setQuantity(_ quantity: Int, product: Product) {
        products[product] = quantity
    }
    
    func number(of product: Product) -> Int {
        return products[product, default: 0]
    }
    
    
    func totalPrice() -> Double {
        return products.reduce(0, { (result, current) in
            return result + current.key.price * Double(current.value)
        })
    }
}


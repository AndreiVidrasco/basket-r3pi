//
//  CurrencyViewController.swift
//  Basket
//
//  Created by Andrei Vidrasco on 28/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import UIKit

struct CurrencyViewController {
    static func instantiate(with currencies: [Currency],
                            totalPrice: Double? = nil,
                            updateCurrency: @escaping (Currency) -> Void) -> ItemsViewController<Currency, UITableViewCell> {
        let currencyViewController = ItemsViewController(items: currencies, configure: { (cell, currency) in
            cell.textLabel?.text = currency.formattedCellTitle(with: totalPrice)
            cell.textLabel?.numberOfLines = 0
        })
        
        currencyViewController.didSelect = { currency, controller in
            updateCurrency(currency)
            controller.dismiss(animated: true, completion: nil)
        }
        
        return currencyViewController
    }
    
}

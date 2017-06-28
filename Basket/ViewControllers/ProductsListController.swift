//
//  ViewController.swift
//  Basket
//
//  Created by Andrei Vidrasco on 23/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import UIKit

struct ProductsListController {
    func initialViewController() -> UIViewController {
        var basket = Basket()
        var savedCurrency = Currency.default
        var currencies = [savedCurrency]
        NetworkController().getCurrencies { currencies = $0 }
        let itemsViewController = ItemsViewController(items: getData(), configure: { (cell, product) in
            cell.textLabel?.text = product.formattedTitle(for: basket.number(of: product), with: savedCurrency)
        })
        
        itemsViewController.didSelect = { product, controller in
            let addItemsVC = AddItemsViewController(productName: product.name, count: basket.number(of: product))
            addItemsVC.presentInNavigationController(from: controller) {
                basket.setQuantity(addItemsVC.count, product: product)
                controller.tableView.reloadData()
            }
        }
        
        itemsViewController.navigationItem.rightBarButtonItem = BlockBarButtonItem(title: "Checkout", actionHandler: {
            let checkoutVC = CheckoutViewController(totalPrice: savedCurrency.formattedPrice(with: basket.totalPrice()))
            checkoutVC.navigationItem.leftBarButtonItem = BlockBarButtonItem(title: "Currency", actionHandler: {
                let currencyViewController = CurrencyViewController.instantiate(with: currencies, totalPrice: basket.totalPrice()) { currency in
                    savedCurrency = currency
                    checkoutVC.updateTotalPrice(currency.formattedPrice(with: basket.totalPrice()))
                    itemsViewController.tableView.reloadData()
                }
                currencyViewController.presentInNavigationController(from: checkoutVC)
            })
            checkoutVC.presentInNavigationController(from: itemsViewController)
        })
        
        itemsViewController.navigationItem.leftBarButtonItem = BlockBarButtonItem(title: "Currency", actionHandler: {
            let currencyViewController = CurrencyViewController.instantiate(with: currencies) { currency in
                savedCurrency = currency
                itemsViewController.tableView.reloadData()
            }
            currencyViewController.presentInNavigationController(from: itemsViewController)
        })
        return UINavigationController(rootViewController: itemsViewController)
    }
    
    
    func getData() -> [Product] {
        if let url = Bundle.main.url(forResource: "Products", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let products = try? PropertyListDecoder().decode([Product].self, from: data) {
            return products
        } else {
            return []
        }
    }
}

extension UIViewController {
    func presentInNavigationController(from presenter: UIViewController, completion: (() -> Void)? = nil) {
        let navigationController = UINavigationController(rootViewController: self)
        navigationItem.rightBarButtonItem = BlockBarButtonItem(title: "Done", actionHandler: {
            completion?()
            navigationController.dismiss(animated: true, completion: nil)
        })
        presenter.present(navigationController, animated: true, completion: nil)
    }
}


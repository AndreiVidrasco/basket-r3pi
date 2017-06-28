//
//  CheckoutViewController.swift
//  Basket
//
//  Created by Andrei Vidrasco on 24/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    let basketLabel = UILabel()
    
    init(totalPrice: String) {
        basketLabel.text = totalPrice
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(basketLabel)
        basketLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        basketLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        basketLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateTotalPrice(_ totalPrice: String) {
        basketLabel.text = totalPrice
    }
}


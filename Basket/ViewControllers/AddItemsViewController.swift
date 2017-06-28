//
//  AddItemsViewController.swift
//  Basket
//
//  Created by Andrei Vidrasco on 24/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import UIKit

class AddItemsViewController: UIViewController {
    let productName: String
    var stepper = UIStepper()
    var productCountLabel = UILabel()
    
    var count: Int
    init(productName: String, count: Int) {
        self.productName = productName
        self.count = count
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(productCountLabel)
        productCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        productCountLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        stepper.value = Double(count)
        view.addSubview(stepper)
        stepper.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stepper.centerYAnchor.constraint(equalTo: productCountLabel.centerYAnchor, constant: 50).isActive = true
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        
        stepperValueChanged()
        
        let productNameLabel = UILabel()
        productNameLabel.text = productName
        view.addSubview(productNameLabel)
        productNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        productNameLabel.centerYAnchor.constraint(equalTo: productCountLabel.centerYAnchor, constant: -50).isActive = true
        
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false
        productCountLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func stepperValueChanged() {
        count = Int(stepper.value)
        productCountLabel.text = "\(count)"
    }
}

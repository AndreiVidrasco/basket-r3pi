//
//  BlockBarButtonItem.swift
//  Basket
//
//  Created by Andrei Vidrasco on 24/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import UIKit

class BlockBarButtonItem: UIBarButtonItem {
    private var actionHandler: (() -> Void)?
    
    convenience init(title: String?, style: UIBarButtonItemStyle = .plain, actionHandler: (() -> Void)?) {
        self.init(title: title, style: style, target: nil, action: #selector(barButtonItemPressed))
        self.target = self
        self.actionHandler = actionHandler
    }
    
    @objc func barButtonItemPressed() {
        actionHandler?()
    }
}


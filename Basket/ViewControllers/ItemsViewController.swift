//
//  ItemsViewController.swift
//  Remote
//
//  Created by Andrei Vidrasco on 04/01/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import UIKit

final class ItemsViewController<Item: Equatable, Cell: UITableViewCell>: UITableViewController {
    var items: [Item]
    let reuseIdentifier = "Cell"
    let configure: (Cell, Item) -> ()
    var didSelect: (Item, ItemsViewController<Item, Cell>) -> () = { _, _ in }
    
    init(items: [Item], configure: @escaping (Cell, Item) -> ()) {
        self.configure = configure
        self.items = items
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateItems(items: [Item]) {
        self.items = items
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _ = Bundle.main.path(forResource: String(describing: Cell.self), ofType: "nib") {
            let nib = UINib(nibName: String(describing: Cell.self), bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
        } else {
            tableView.register(Cell.self, forCellReuseIdentifier: reuseIdentifier)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        didSelect(item, self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Cell
        if indexPath.row >= items.count {
            tableView.reloadData()
        } else {
            let item = items[indexPath.row]
            configure(cell, item)
        }
        return cell
    }
}


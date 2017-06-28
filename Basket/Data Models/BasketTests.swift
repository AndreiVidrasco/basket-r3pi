//
//  BasketTests.swift
//  BasketTests
//
//  Created by Andrei Vidrasco on 23/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import XCTest
@testable import Basket

class BasketTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAddingItemsToBasket() {
        var basket = Basket()
        let eggs = Product(name: "Eggs", price: 2.1, unit: "per dozen")
        basket.setQuantity(10, product: eggs)
        XCTAssertEqual(basket.number(of: eggs), 10)
        basket.setQuantity(0, product: eggs)
        XCTAssertEqual(basket.number(of: eggs), 0)
    }
    
    func testRemovingItemsFromBasket() {
        var basket = Basket()
        let eggs = Product(name: "Eggs", price: 2.1, unit: "per dozen")
        let beans = Product(name: "Beans", price: 1.2, unit: "can")
        basket.setQuantity(10, product: eggs)
        basket.setQuantity(5, product: beans)
        XCTAssertEqual(basket.totalPrice(), 27)
    }
    
}

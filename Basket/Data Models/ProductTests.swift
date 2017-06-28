//
//  ProductTests.swift
//  BasketTests
//
//  Created by Andrei Vidrasco on 28/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import XCTest
@testable import Basket

class ProductTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEquality() {
        let model1 = Product(name: "Eggs", price: 1.5, unit: "dozen")
        let model2 = Product(name: "Eggs", price: 1.5, unit: "dozen")
        let model3 = Product(name: "Beans", price: 1.2, unit: "can")
        XCTAssertEqual(model1, model2)
        XCTAssertNotEqual(model1, model3)
    }
    
    func testPerformanceExample() {
        let currency = Currency.default
        let model1 = Product(name: "Eggs", price: 1.5, unit: "dozen")
        XCTAssertEqual(model1.formattedTitle(for: 0, with: currency), "Eggs with $1.50 per dozen")
        XCTAssertEqual(model1.formattedTitle(for: 1, with: currency), "1 dozen of Eggs with $1.50 per dozen")
        XCTAssertEqual(model1.formattedTitle(for: 3, with: currency), "3 dozens of Eggs with $1.50 per dozen")
    }
    
}

//
//  CurrencyTests.swift
//  BasketTests
//
//  Created by Andrei Vidrasco on 28/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import XCTest
@testable import Basket

class CurrencyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEquality() {
        let model1 = Currency.default
        let model2 = Currency(code: "USD", fullTitle: "United States Dollar", quoteToUSD: 1.0)
        let model3 = Currency(code: "EUR", fullTitle: "Euro", quoteToUSD: 1.1)
        XCTAssertEqual(model1, model2)
        XCTAssertNotEqual(model1, model3)
    }
    
    func testFormattedTitle() {
        let model1 = Currency.default
        XCTAssertEqual(model1.formattedPrice(with: 10), "$10.00")
    }
    
    func testCellTitle() {
        let model1 = Currency.default
        XCTAssertEqual(model1.formattedCellTitle(with: 10), "USD - United States Dollar - $10.00")
        XCTAssertEqual(model1.formattedCellTitle(with: nil), "USD - United States Dollar")
    }
    
    
    func testParsingOfCurrencies() {
        let currencies = ["USD": "United States Dollar",
                          "AUD": "Australian Dollar",
                          "EUR": "Euro",
                          "CAD": "Canadian Dollar",
                          "BTC": "Bitcoin",
                          "GBP": "British Pound Sterling",
                          "NZD": "New Zealand Dollar",
                          "CHF": "Swiss Franc"]
        let rates      = ["USDUSD": 1.0,
                          "USDAUD": 1.308103,
                          "USDEUR": 0.87859799999999999,
                          "USDCAD": 1.3032900000000001,
                          "USDBTC": 0.00038499999999999998,
                          "USDGBP": 0.77337999999999996,
                          "USDNZD": 1.3672010000000001,
                          "USDCHF": 0.95962000000000003]
        let models = [Currency(code: "AUD", fullTitle: "Australian Dollar", quoteToUSD: 1.308103),
                      Currency(code: "BTC", fullTitle: "Bitcoin", quoteToUSD: 0.00038499999999999998),
                      Currency(code: "CAD", fullTitle: "Canadian Dollar", quoteToUSD: 1.3032900000000001),
                      Currency(code: "CHF", fullTitle: "Swiss Franc", quoteToUSD: 0.95962000000000003),
                      Currency(code: "EUR", fullTitle: "Euro", quoteToUSD: 0.87859799999999999),
                      Currency(code: "GBP", fullTitle: "British Pound Sterling", quoteToUSD: 0.77337999999999996),
                      Currency(code: "NZD", fullTitle: "New Zealand Dollar", quoteToUSD: 1.3672010000000001),
                      Currency(code: "USD", fullTitle: "United States Dollar", quoteToUSD: 1.0)]
        let x = Currency.parse(currencies: currencies, exchangeRates: rates)
        XCTAssertEqual(x, models)
        
    }
}

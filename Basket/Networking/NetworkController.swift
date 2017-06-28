//
//  NetworkController.swift
//  Basket
//
//  Created by Andrei Vidrasco on 24/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import UIKit


struct NetworkController {
    enum URLs: String {
        case currency = "http://apilayer.net/api/list?access_key=f4a82b28e9c83cc8dc29be10b1b03f97"
        case liveQuotes = "http://apilayer.net/api/live?access_key=f4a82b28e9c83cc8dc29be10b1b03f97"
        
        func url() -> URL {
            return URL(string: rawValue)!
        }
    }
    
    struct Currencies: Decodable {
        let currencies: [String: String]
    }
    
    struct Quotes: Decodable {
        let quotes: [String: Double]
    }
    
    
    let foregroundSession = URLSession(configuration: URLSessionConfiguration.default)
    
    func restCall<T: Decodable>(url : URLs, completion: @escaping (T?) -> Void ) {
        let task = self.foregroundSession.dataTask(with: url.url(), completionHandler: { (data : Data?, response : URLResponse?, error : Error?) -> Void in
            if nil != error {
                completion(nil)
            } else if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(decoded)
                } catch {
                    completion(nil)
                }
            }
        })
        task.resume()
    }
    
    
    func getCurrencies(completion: @escaping ([Currency]) -> Void) {
        var currencies: Currencies?
        var exchangeRates: Quotes?
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        restCall(url: .currency) { (result: Currencies?) in
            currencies = result
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        restCall(url: .liveQuotes) { (result: Quotes?) in
            exchangeRates = result
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .global(qos: .background)) {
            if let currencies = currencies,
                let exchangeRates = exchangeRates {
                completion(Currency.parse(currencies: currencies.currencies,
                                          exchangeRates: exchangeRates.quotes))
            }
        }
    }
}

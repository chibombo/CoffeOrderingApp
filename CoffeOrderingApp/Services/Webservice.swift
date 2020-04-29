//
//  Webservice.swift
//  CoffeOrderingApp
//
//  Created by Genaro Arvizu on 29/04/20.
//  Copyright © 2020 GAR. All rights reserved.
//

import Foundation

class Webservice {

    func createCoffeeOrder(order: Order, completion: @escaping(CreateOrderResponse?)->Void) {
        guard let url: URL = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("Invalid URL")
            return
        }

        var urlrequest: URLRequest = URLRequest(url: url)
        urlrequest.httpMethod = "POST"
        urlrequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlrequest.httpBody = try? JSONEncoder().encode(order)

        URLSession.shared.dataTask(with: urlrequest) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let aData: Data = data, error == nil else {
                return
            }
        }.resume()
    }


    func getAllOrders(completion: @escaping([Order]?) -> Void) {
        guard let url: URL = URL(string: "https://island-bramble.glitch.me/orders") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            guard let aData: Data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            if let orders: [Order] = try? JSONDecoder().decode([Order].self, from: aData) {
                DispatchQueue.main.async {
                    completion(orders)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }

}

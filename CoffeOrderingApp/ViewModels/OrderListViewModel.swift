//
//  OrderListViewModel.swift
//  CoffeOrderingApp
//
//  Created by Genaro Arvizu on 29/04/20.
//  Copyright © 2020 GAR. All rights reserved.
//

import Foundation

class OrderListViewModel: ObservableObject {

    @Published var orders: [OrderViewModel] = [OrderViewModel]()

    init() {
        fetchOrders()
    }

    func fetchOrders() {
        Webservice().getAllOrders { (orders: [Order]?) in
            if let anOrders: [Order] = orders {
                self.orders = anOrders.map(OrderViewModel.init)
            }
        }
    }
}



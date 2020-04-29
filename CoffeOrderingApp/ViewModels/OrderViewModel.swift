//
//  OrderViewModel.swift
//  CoffeOrderingApp
//
//  Created by Genaro Arvizu on 29/04/20.
//  Copyright © 2020 GAR. All rights reserved.
//

import Foundation

class OrderViewModel: ObservableObject {

    let id: UUID = UUID()

    var order: Order

    var name: String {
        return order.name
    }

    var size: String {
        return order.size
    }

    var coffeeName: String {
        return order.coffeeName
    }

    var total: Double {
        return order.total
    }

    init(order: Order) {
        self.order = order
    }
}

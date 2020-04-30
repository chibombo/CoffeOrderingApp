//
//  CoffeeViewModel.swift
//  CoffeOrderingApp
//
//  Created by Luis Genaro Arvizu Vega on 29/04/20.
//  Copyright © 2020 GAR. All rights reserved.
//

import Foundation

class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}

struct CoffeeViewModel {
                
    let id: UUID = UUID()

    var coffee: Coffee

    var name: String {
        return coffee.name
    }

    var imageURL: String {
        return coffee.imageURL
    }

    var price: Double {
        return coffee.price
    }


    init(coffee: Coffee) {
        self.coffee = coffee
    }
}

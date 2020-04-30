//
//  AddCoffeeOrderViewModel.swift
//  CoffeOrderingApp
//
//  Created by Luis Genaro Arvizu Vega on 29/04/20.
//  Copyright © 2020 GAR. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    var name: String = ""
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    @Published var size: String = "Large"
    @Published var coffeeName: String = ""
    
    private var webService: Webservice
        
    
    init() {
        webService = Webservice()
    }
    
    func placeOrder() {
        let order = Order(name: self.name,
                          size: self.size,
                          coffeeName: self.coffeeName,
                          total: self.total)
        
        self.webService.createCoffeeOrder(order: order) { (response: CreateOrderResponse?) in
            guard let aResponse: CreateOrderResponse = response else {
                return
            }
        }
    }
    
    private func calculateTotalPrice() -> Double {
        let aCoffeeVM = coffeeList.first{ $0.name == coffeeName}
        
        if let coffeeVM = aCoffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0
        }
    }
 
    private func priceForSize() -> Double {
        let prices = [
            "Tall": 50.0,
            "Large": 55.0,
            "Bentie": 60.0
        ]
        return prices[self.size]!
    }
    
}

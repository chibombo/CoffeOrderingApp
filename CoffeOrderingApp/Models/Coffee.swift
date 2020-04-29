//
//  Coffee.swift
//  CoffeOrderingApp
//
//  Created by Genaro Arvizu on 29/04/20.
//  Copyright © 2020 GAR. All rights reserved.
//

import Foundation

struct Coffee {
    let name: String
    let imageURL: String
    let price: Double
}

extension Coffee {

    static func all() -> [Coffee] {
        return [
            Coffee(name: "Caramel Macchiato", imageURL: "Caramel Macchiato", price: 50.0),
            Coffee(name: "American", imageURL: "American", price: 30.0),
            Coffee(name: "Cappuchino", imageURL: "Cappuchino", price: 40.0)
        ]
    }

}

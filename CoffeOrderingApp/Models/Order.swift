//
//  Order.swift
//  CoffeOrderingApp
//
//  Created by Genaro Arvizu on 29/04/20.
//  Copyright © 2020 GAR. All rights reserved.
//

import Foundation

struct Order: Codable {

    let name: String
    let size: String
    let coffeeName: String
    let total: Double

}

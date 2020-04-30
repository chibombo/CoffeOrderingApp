//
//  OrderTotalView.swift
//  CoffeOrderingApp
//
//  Created by Luis Genaro Arvizu Vega on 29/04/20.
//  Copyright © 2020 GAR. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "%.2f", self.total))
                .font(.title)
                .foregroundColor(Color.green)
            Spacer()
        }
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 120.0)
    }
}

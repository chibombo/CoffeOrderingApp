//
//  ContentView.swift
//  CoffeOrderingApp
//
//  Created by Genaro Arvizu on 29/04/20.
//  Copyright © 2020 GAR. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM: OrderListViewModel = OrderListViewModel()

    var body: some View {
        NavigationView {
            OrderListView(orders: self.orderListVM.orders)

                .navigationBarTitle("Coffee Orders")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

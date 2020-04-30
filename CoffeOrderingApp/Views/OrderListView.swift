//
//  OrderListView.swift
//  CoffeOrderingApp
//
//  Created by Genaro Arvizu on 29/04/20.
//  Copyright © 2020 GAR. All rights reserved.
//

import SwiftUI

struct OrderListView: View {

    let orders: [OrderViewModel]

    init(orders: [OrderViewModel]) {
        self.orders = orders
    }

    var body: some View {
        List {
            ForEach(self.orders,
                    id: \.id) { order in
                        HStack {
                            Image(order.coffeeName)
                                .resizable()
                                .frame(width: 100,
                                       height: 100,
                                       alignment: .center)
                                .cornerRadius(16)
                            VStack(alignment: .leading){
                                Text(order.name)
                                    .font(.title)
                                    .padding([.leading, .bottom], 10)

                                HStack {

                                    Text(order.coffeeName)
                                        .frame(width: 100, height: 20)
                                        .padding(EdgeInsets(top: 10,
                                                            leading: 10,
                                                            bottom: 10,
                                                            trailing: 10))
                                        .minimumScaleFactor(0.5)
                                        .background(Color.gray)
                                        .foregroundColor(Color.white)
                                        .cornerRadius(10)
                                    Text(order.size)
                                        .frame(width: 100, height: 20)
                                        .padding(EdgeInsets(top: 10,
                                                            leading: 10,
                                                            bottom: 10,
                                                            trailing: 10))
                                        .background(Color.blue)
                                        .foregroundColor(Color.white)
                                    .cornerRadius(10)
                                }
                            }
                        }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        //        let order: Order = Order(name: "Brenda Ahedo", size: "Alto", coffeeName: "Cafe Americano", total: 30)
        OrderListView(orders:[OrderViewModel(order: Order(name: "Brenda Ahedo", size: "Alto", coffeeName: "American", total: 30))])
    }
}

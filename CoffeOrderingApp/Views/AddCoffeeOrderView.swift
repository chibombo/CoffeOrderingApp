//
//  AddCoffeeOrderView.swift
//  CoffeOrderingApp
//
//  Created by Luis Genaro Arvizu Vega on 29/04/20.
//  Copyright © 2020 GAR. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @ObservedObject var addCoffeOrderVM: AddCoffeeOrderViewModel = AddCoffeeOrderViewModel()
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {            
            VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter name", text: self.$addCoffeOrderVM.name)
                    }
                    Section(header: Text("SELECT COFFEE")) {
                        ForEach(addCoffeOrderVM.coffeeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeOrderVM.coffeeName)
                        }
                    }
                    Section(header: Text("SELECT COFFEE"), footer: OrderTotalView(total: self.addCoffeOrderVM.total)) {
                        Picker("", selection: self.$addCoffeOrderVM.size) {
                            Text("Tall")
                            .tag("Tall")
                            Text("Large")
                            .tag("Large")
                            Text("Bentie")
                            .tag("Bentie")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                HStack {
                    Button("Place Order") {
                        self.addCoffeOrderVM.placeOrder()
                        self.isPresented = false
                    }
                }.padding(EdgeInsets(top: 12,
                                     leading: 100,
                                     bottom: 12,
                                     trailing: 100))
                    .background(Color.green)
                    .foregroundColor(.white)
                .cornerRadius(15)
            }
            .navigationBarTitle("Add Order")
        }
    }
    
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: Binding<Bool>.constant(false))
    }
}

struct CoffeeCellView: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100,
                       height: 100,
                       alignment: .center)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding(.leading)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark" : "").padding()
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}

//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by Dylan Perry on 8/2/20.
//

import SwiftUI

struct AddressView {
    @ObservedObject var order: Order

}

extension AddressView: View {
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.details.deliveryAddress.name)
                TextField("Street Address", text: $order.details.deliveryAddress.streetAddress)
                TextField("City", text: $order.details.deliveryAddress.city)
                TextField("Zip", text: $order.details.deliveryAddress.zip)
                    .keyboardType(.decimalPad)

            }

            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check out")
                }
            }
            .disabled(order.details.deliveryAddress.isValid == false)

        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}

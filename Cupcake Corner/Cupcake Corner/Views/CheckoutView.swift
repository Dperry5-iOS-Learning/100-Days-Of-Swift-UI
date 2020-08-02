//
//  CheckoutView.swift
//  Cupcake Corner
//
//  Created by Dylan Perry on 8/2/20.
//

import SwiftUI

struct CheckoutView {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var alertHeader = ""
    @State private var showingConfirmation = false

}

extension CheckoutView {
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                self.alertHeader = "ERROR"
                self.confirmationMessage = "ERROR: Your order FAILED! Try again later"
                self.showingConfirmation = true
                return
            }
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.alertHeader = "Thank You"
                self.confirmationMessage = "Your order for \(decodedOrder.details.quantity)x \(OrderDetails.types[decodedOrder.details.type].lowercased()) cupcakes is on its way!"
                self.showingConfirmation = true
            } else {
                print("Invalid response from server")
            }
            
        }.resume()
    }
}

extension CheckoutView: View {
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)

                    Text("Your total is $\(self.order.details.cost, specifier: "%.2f")")
                        .font(.title)

                    Button("Place Order") {
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text(alertHeader), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}

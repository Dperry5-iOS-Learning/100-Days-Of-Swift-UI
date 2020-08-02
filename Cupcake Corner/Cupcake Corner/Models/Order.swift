//
//  Order.swift
//  Cupcake Corner
//
//  Created by Dylan Perry on 8/2/20.
//

import SwiftUI

class Order: ObservableObject {

    @Published
    var details: OrderDetails = OrderDetails()
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        details = try container.decode(OrderDetails.self, forKey: .details)
    }
}

extension Order: Codable {
    enum CodingKeys: CodingKey {
        case details
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(details, forKey: .details)
        
    }
    

}

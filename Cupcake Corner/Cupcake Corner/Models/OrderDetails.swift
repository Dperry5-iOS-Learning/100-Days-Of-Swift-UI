//
//  OrderDetails.swift
//  Cupcake Corner
//
//  Created by Dylan Perry on 8/2/20.
//

struct OrderDetails: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
               if specialRequestEnabled == false {
                   extraFrosting = false
                   addSprinkles = false
               }
           }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(type) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
    
    
    var deliveryAddress = Address()

}

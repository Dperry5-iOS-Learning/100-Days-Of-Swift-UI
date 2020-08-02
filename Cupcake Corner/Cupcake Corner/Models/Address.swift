//
//  Address.swift
//  Cupcake Corner
//
//  Created by Dylan Perry on 8/2/20.
//

import Foundation

struct Address: Codable {
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = "" {
        didSet {
            let filtered = zip.filter { $0.isNumber }
            if zip != filtered {
                zip = filtered
            }
        }
    }
    
    var isValid: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }

        return true
    }
}

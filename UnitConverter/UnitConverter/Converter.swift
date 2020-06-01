//
//  Converter.swift
//  UnitConverter
//
//  Created by Dylan Perry on 5/31/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import Foundation

struct Converter {
    static func convert(value: Float, from fromUnit: Unit, to toUnit: Unit) -> Float {
        switch fromUnit {
        case .cups:
            return CupsConverter.convert(value: value, to: toUnit)
        case .pints:
            return PintsConverter.convert(value: value, to: toUnit)
        case .gallons:
            return GallonsConverter.convert(value: value, to: toUnit)
        case .liters:
            return LitersConverter.convert(value: value, to: toUnit)
        case .milliliters:
            return MilliliterConverter.convert(value: value, to: toUnit)
        }
    }
}

extension Converter {
    struct MilliliterConverter {
        static func convert(value: Float, to toUnit: Unit) -> Float {
            switch toUnit {
            case .cups:
                return toCups(input: value)
            case .pints:
                return toPints(input: value)
            case .gallons:
                return toGallons(input: value)
            case .liters:
                return toLiters(input: value)
            case .milliliters:
                return value
            }
        }
        
        static func toLiters(input: Float) -> Float {
            return input / 1000
        }
        
        static func toCups(input: Float) -> Float {
            return input / 237
        }
        
        static func toPints(input: Float) -> Float {
            return input / 473
        }
        
        static func toGallons(input: Float) -> Float {
            return input / 3785
        }
    }
}

// Liters To....
extension Converter {
    struct LitersConverter {
        static func convert(value: Float, to toUnit: Unit) -> Float {
            switch toUnit {
            case .cups:
                return toCups(input: value)
            case .pints:
                return toPints(input: value)
            case .gallons:
                return toGallons(input: value)
            case .liters:
                return value
            case .milliliters:
                return toMilliliters(input: value)
            }
        }
        
        static func toMilliliters(input: Float) -> Float {
            return input * 1000
        }
        
        static func toCups(input: Float) -> Float {
            return input / 4.227
        }
        
        static func toPints(input: Float) -> Float {
            return input / 2.113

        }
        static func toGallons(input: Float) -> Float {
            return input * 3.785
        }
    }
}

// Cups to..
extension Converter {
    struct CupsConverter {
        static func convert(value: Float, to toUnit: Unit) -> Float {
            switch toUnit {
            case .cups:
                return value
            case .pints:
                return toPints(input: value)
            case .gallons:
                return toGallons(input: value)
            case .liters:
                return toLiters(input: value)
            case .milliliters:
                return toMilliliters(input: value)
            }
        }
        
        static func toMilliliters(input: Float) -> Float {
            return input * 237
        }
        
        static func toLiters(input: Float) -> Float {
            return input / 4.227
        }
        
        static func toPints(input: Float) -> Float {
            return input / 2
        }
        
        static func toGallons(input: Float) -> Float {
            return input / 16
        }
    }
}

// Pints to...
extension Converter {
    struct PintsConverter {
        static func convert(value: Float, to toUnit: Unit) -> Float {
            switch toUnit {
            case .cups:
                return toCups(input: value)
            case .pints:
                return value
            case .gallons:
                return toGallons(input: value)
            case .liters:
                return toLiters(input: value)
            case .milliliters:
                return toMilliliters(input: value)
            }
        }
        
        static func toMilliliters(input: Float) -> Float {
            return input * 473
        }
        
        static func toLiters(input: Float) -> Float {
            return input / 2.113
        }
        
        static func toCups(input: Float) -> Float {
            return input * 2
        }
        
        static func toGallons(input: Float) -> Float {
            return input / 8
        }
    }
}

// Gallons to...
extension Converter {
    struct GallonsConverter {
        static func convert(value: Float, to toUnit: Unit) -> Float {
            switch toUnit {
            case .cups:
                return toCups(input: value)
            case .pints:
                return toPints(input: value)
            case .gallons:
                return value
            case .liters:
                return toLiters(input: value)
            case .milliliters:
                return toMilliliters(input: value)
            }
        }
        
        static func toMilliliters(input: Float) -> Float {
            return input * 3785
        }
        
        static func toLiters(input: Float) -> Float {
            return input * 3.785
        }
        
        static func toCups(input: Float) -> Float {
            return input * 16
        }
        
        static func toPints(input: Float) -> Float {
            return input * 8
        }
    }
}

//
//  Kilogram.swift
//  SwiftTest
//
//  Created by Joker on 2019/12/9.
//  Copyright © 2019 Joker. All rights reserved.
//

import Foundation

struct Kilogram: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, ExpressibleByStringLiteral, ExpressibleByNilLiteral {
    var kg: Double
    var lb: Double {
        set {
            self.kg = newValue * 0.45359237
        }
        get {
            self.kg * 2.20462262
        }
    }
    
    init(_ kg: Double) {
        self.kg = kg
    }
    
    init() {
        self.kg = 0
    }
    
    init(floatLiteral value: Double) {
        self.kg = value
    }
    
    init(integerLiteral value: Int) {
        self.kg = Double(value)
    }
    
    init(stringLiteral value: String) {
        self.kg = Double(value) ?? 0
    }
    
    init(nilLiteral: ()) {
        self.kg = 0
    }
    
    static func + (v1: Kilogram, v2: Kilogram) -> Kilogram {
        Kilogram(v1.kg + v2.kg)
    }
    
    static func - (v1: Kilogram, v2: Kilogram) -> Kilogram {
        Kilogram(v1.kg - v2.kg)
    }
    
    static func * (v1: Kilogram, v2: Kilogram) -> Kilogram {
        Kilogram(v1.kg * v2.kg)
    }
    
    static func / (v1: Kilogram, v2: Kilogram) -> Kilogram {
        Kilogram(v1.kg / v2.kg)
    }
}

//
//  Commodity.swift
//  SwiftTest
//
//  Created by Joker on 2019/12/9.
//  Copyright © 2019 Joker. All rights reserved.
//

import Foundation

class Fruit {
    enum Price<Double> {
        case kg(Double)
        case lb(Double)
    }
    
    var name: String
    var price: Price<Double>
    init(name: String, price: Price<Double>) {
        self.name = name
        self.price = price
    }
}



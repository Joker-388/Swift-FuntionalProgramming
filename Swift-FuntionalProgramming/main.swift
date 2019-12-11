//
//  main.swift
//  Swift-FuntionalProgramming
//
//  Created by Joker on 2019/12/11.
//  Copyright © 2019 Joker. All rights reserved.
//

import Foundation


// MARK: - 需求
// 5公斤苹果 => 打9折 => 优惠-3
var apple = Fruit(name: "🍎", price: .lb(3))
var appleWeight: Kilogram = 10


// MARK: - 业务
/// 原价 = 单价 * 重量
func originalPrice(_ weight: Kilogram, _ fruit: Fruit) -> Double{
    switch fruit.price {
    case let .kg(kg):
        return kg * weight.kg
    case let .lb(lb):
        return lb * weight.lb
    }
}
/// 折扣价 = 原价 * 折扣率
func discountPrice(_ originPrice: Double, _ rate: Double) -> Double {
    return originPrice * rate
}

/// 最终价 = 折扣价 - 优惠金额
func reductionPrice(_ discountPrice: Double, _ reduction: Double) -> Double {
    return discountPrice - reduction
}

var price = reductionPrice(discountPrice(originalPrice(appleWeight, apple), 0.9), 3)
print(price)

// MARK: - 手动柯里化
//func originalPrice(_ fruit: Fruit) -> (_ weight: Kilogram) -> Double {
//    {
//        weight in
//        switch fruit.price {
//        case let .kg(kg):
//            return kg * weight.kg
//        case let .lb(lb):
//            return lb * weight.lb
//        }
//    }
//}
//
//func discountPrice(_ rate: Double) -> (_ originPrice: Double) -> Double {
//    {
//        originPrice in
//        rate * originPrice
//    }
//}
//
//func reductionPrice(_ reduction: Double) -> (_ discountPrice : Double) -> Double {
//    {
//        discountPrice in
//        discountPrice - reduction
//    }
//}

//func originalPrice(_ fruit: Fruit) -> (Kilogram) -> Double {
//    {
//        switch fruit.price {
//        case let .kg(kg):
//            return kg * $0.kg
//        case let .lb(lb):
//            return lb * $0.lb
//        }
//    }
//}
//
//func discountPrice(_ rate: Double) -> (Double) -> Double {{ rate * $0 }}
//
//func reductionPrice(_ reduction: Double) -> (Double) -> Double {{ $0 - reduction }}

// MARK: - 函数组合
//infix operator >>> : AdditionPrecedence
//func >>><A, B, C>(_ f1: @escaping (A) -> B, _ f2: @escaping (B) -> C) -> (A) -> C {
//    {
//        a in
//        f2(f1(a))
//    }
//}

infix operator >>> : AdditionPrecedence
func >>><A, B, C>(_ f1: @escaping (A) -> B, _ f2: @escaping (B) -> C) -> (A) -> C { { f2(f1($0)) } }

//var applePriceFuction = originalPrice(apple) >>> discountPrice(0.9) >>> reductionPrice(3)
//price = applePriceFuction(10) // 56.52481073999999
//print("--", price)

// MARK: - 柯里化函数
prefix func ~<A, B, C>(_ fn: @escaping (A, B) -> C) -> (B) -> (A) -> C {
    {
        b in
        {
            a in
            fn(a, b)
        }
    }
}

// MARK: - 业务流封装
var applePriceFuction = (~originalPrice)(apple) >>> (~discountPrice)(0.9) >>> (~reductionPrice)(3)

// MARK: - 输出
print(applePriceFuction("5"))
print(applePriceFuction(4.5))
print(applePriceFuction(10))


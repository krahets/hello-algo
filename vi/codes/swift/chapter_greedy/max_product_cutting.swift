/**
 * File: max_product_cutting.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

import Foundation

func pow(_ x: Int, _ y: Int) -> Int {
    Int(Double(truncating: pow(Decimal(x), y) as NSDecimalNumber))
}

/* Max product cutting: Greedy algorithm */
func maxProductCutting(n: Int) -> Int {
    // When n <= 3, must cut out a 1
    if n <= 3 {
        return 1 * (n - 1)
    }
    // Greedily cut out 3, a is the number of 3s, b is the remainder
    let a = n / 3
    let b = n % 3
    if b == 1 {
        // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
        return pow(3, a - 1) * 2 * 2
    }
    if b == 2 {
        // When the remainder is 2, do nothing
        return pow(3, a) * 2
    }
    // When the remainder is 0, do nothing
    return pow(3, a)
}

@main
enum MaxProductCutting {
    static func main() {
        let n = 58

        // Greedy algorithm
        let res = maxProductCutting(n: n)
        print("Maximum cutting product is \(res)")
    }
}

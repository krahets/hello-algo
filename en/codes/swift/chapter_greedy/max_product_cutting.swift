/**
 * File: max_product_cutting.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

import Foundation

func pow(_ x: Int, _ y: Int) -> Int {
    Int(Double(truncating: pow(Decimal(x), y) as NSDecimalNumber))
}

/* Greedy maximum product algorithm */
func maxProductCutting(n: Int) -> Int {
    // When n <= 3, one piece must be 1
    if n <= 3 {
        return 1 * (n - 1)
    }
    // Greedily cut off pieces of size 3. Let a be their count and b the remainder
    let a = n / 3
    let b = n % 3
    if b == 1 {
        // If the remainder is 1, replace one pair 1 * 3 with 2 * 2
        return pow(3, a - 1) * 2 * 2
    }
    if b == 2 {
        // If the remainder is 2, leave it as is
        return pow(3, a) * 2
    }
    // If the remainder is 0, no adjustment is needed
    return pow(3, a)
}

@main
enum MaxProductCutting {
    static func main() {
        let n = 58

        // Greedy algorithm
        let res = maxProductCutting(n: n)
        print("The maximum product after cutting is \(res)")
    }
}

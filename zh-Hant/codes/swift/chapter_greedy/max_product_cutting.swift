/**
 * File: max_product_cutting.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

import Foundation

func pow(_ x: Int, _ y: Int) -> Int {
    Int(Double(truncating: pow(Decimal(x), y) as NSDecimalNumber))
}

/* 最大切分乘积：贪心 */
func maxProductCutting(n: Int) -> Int {
    // 当 n <= 3 时，必须切分出一个 1
    if n <= 3 {
        return 1 * (n - 1)
    }
    // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
    let a = n / 3
    let b = n % 3
    if b == 1 {
        // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
        return pow(3, a - 1) * 2 * 2
    }
    if b == 2 {
        // 当余数为 2 时，不做处理
        return pow(3, a) * 2
    }
    // 当余数为 0 时，不做处理
    return pow(3, a)
}

@main
enum MaxProductCutting {
    static func main() {
        let n = 58

        // 贪心算法
        let res = maxProductCutting(n: n)
        print("最大切分乘积为 \(res)")
    }
}

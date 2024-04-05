/**
 * File: max_product_cutting.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

import Foundation

func pow(_ x: Int, _ y: Int) -> Int {
    Int(Double(truncating: pow(Decimal(x), y) as NSDecimalNumber))
}

/* 最大切分乘積：貪婪 */
func maxProductCutting(n: Int) -> Int {
    // 當 n <= 3 時，必須切分出一個 1
    if n <= 3 {
        return 1 * (n - 1)
    }
    // 貪婪地切分出 3 ，a 為 3 的個數，b 為餘數
    let a = n / 3
    let b = n % 3
    if b == 1 {
        // 當餘數為 1 時，將一對 1 * 3 轉化為 2 * 2
        return pow(3, a - 1) * 2 * 2
    }
    if b == 2 {
        // 當餘數為 2 時，不做處理
        return pow(3, a) * 2
    }
    // 當餘數為 0 時，不做處理
    return pow(3, a)
}

@main
enum MaxProductCutting {
    static func main() {
        let n = 58

        // 貪婪演算法
        let res = maxProductCutting(n: n)
        print("最大切分乘積為 \(res)")
    }
}

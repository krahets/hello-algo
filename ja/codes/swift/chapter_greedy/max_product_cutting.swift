/**
 * File: max_product_cutting.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

import Foundation

func pow(_ x: Int, _ y: Int) -> Int {
    Int(Double(truncating: pow(Decimal(x), y) as NSDecimalNumber))
}

/* 分割後の積の最大化：貪欲法 */
func maxProductCutting(n: Int) -> Int {
    // n <= 3 の場合、必ず 1 を 1 つ切り出す必要がある
    if n <= 3 {
        return 1 * (n - 1)
    }
    // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
    let a = n / 3
    let b = n % 3
    if b == 1 {
        // 余りが 1 の場合、1 * 3 の組を 2 * 2 に変換する
        return pow(3, a - 1) * 2 * 2
    }
    if b == 2 {
        // 余りが 2 の場合、何もしない
        return pow(3, a) * 2
    }
    // 余りが 0 の場合、何もしない
    return pow(3, a)
}

@main
enum MaxProductCutting {
    static func main() {
        let n = 58

        // 貪欲アルゴリズム
        let res = maxProductCutting(n: n)
        print("分割後の積の最大値は \(res)")
    }
}

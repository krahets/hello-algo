/**
 * File: max_product_cutting.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

import Foundation

func pow(_ x: Int, _ y: Int) -> Int {
    Int(Double(truncating: pow(Decimal(x), y) as NSDecimalNumber))
}

/* Максимальное произведение разбиения: жадный алгоритм */
func maxProductCutting(n: Int) -> Int {
    // Когда n <= 3, необходимо отделить одну 1
    if n <= 3 {
        return 1 * (n - 1)
    }
    // Жадно выделить части по 3, где a — число троек, а b — остаток
    let a = n / 3
    let b = n % 3
    if b == 1 {
        // Когда остаток равен 1, преобразовать пару 1 * 3 в 2 * 2
        return pow(3, a - 1) * 2 * 2
    }
    if b == 2 {
        // Когда остаток равен 2, ничего делать не нужно
        return pow(3, a) * 2
    }
    // Когда остаток равен 0, ничего делать не нужно
    return pow(3, a)
}

@main
enum MaxProductCutting {
    static func main() {
        let n = 58

        // Жадный алгоритм
        let res = maxProductCutting(n: n)
        print("максимальное произведение разбиенияравно \(res)")
    }
}

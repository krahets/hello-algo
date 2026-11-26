/**
 * File: max_product_cutting.swift
 * Created Time: 2023-09-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

import Foundation

func pow(_ x: Int, _ y: Int) -> Int {
    Int(Double(truncating: pow(Decimal(x), y) as NSDecimalNumber))
}

/* Максимальное произведение при разбиении: жадный алгоритм */
func maxProductCutting(n: Int) -> Int {
    // При n <= 3 одно из слагаемых обязательно равно 1
    if n <= 3 {
        return 1 * (n - 1)
    }
    // Выделяем тройки жадно: a — число троек, b — остаток
    let a = n / 3
    let b = n % 3
    if b == 1 {
        // При остатке 1 заменяем пару множителей 1 * 3 на 2 * 2
        return pow(3, a - 1) * 2 * 2
    }
    if b == 2 {
        // При остатке 2 ничего не меняем
        return pow(3, a) * 2
    }
    // При остатке 0 ничего не меняем
    return pow(3, a)
}

@main
enum MaxProductCutting {
    static func main() {
        let n = 58

        // Жадный алгоритм
        let res = maxProductCutting(n: n)
        print("Максимальное произведение при разбиении: \(res)")
    }
}

/**
 * File: max_product_cutting.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.pow

/* Максимальное произведение при разбиении: жадный алгоритм */
fun maxProductCutting(n: Int): Int {
    // При n <= 3 одно из слагаемых обязательно равно 1
    if (n <= 3) {
        return 1 * (n - 1)
    }
    // Выделяем тройки жадно: a — число троек, b — остаток
    val a = n / 3
    val b = n % 3
    if (b == 1) {
        // При остатке 1 заменяем пару множителей 1 * 3 на 2 * 2
        return 3.0.pow((a - 1)).toInt() * 2 * 2
    }
    if (b == 2) {
        // При остатке 2 ничего не меняем
        return 3.0.pow(a).toInt() * 2 * 2
    }
    // При остатке 0 ничего не меняем
    return 3.0.pow(a).toInt()
}

/* Пример запуска */
fun main() {
    val n = 58

    // Жадный алгоритм
    val res = maxProductCutting(n)
    println("Максимальное произведение при разбиении: $res")
}
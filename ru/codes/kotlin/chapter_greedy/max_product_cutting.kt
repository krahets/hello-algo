/**
 * File: max_product_cutting.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.pow

/* Максимальное произведение разрезания: жадный алгоритм */
fun maxProductCutting(n: Int): Int {
    // Когда n <= 3, обязательно нужно выделить одну 1
    if (n <= 3) {
        return 1 * (n - 1)
    }
    // Жадно выделить множители 3, где a — число троек, а b — остаток
    val a = n / 3
    val b = n % 3
    if (b == 1) {
        // Если остаток равен 1, преобразовать одну пару 1 * 3 в 2 * 2
        return 3.0.pow((a - 1)).toInt() * 2 * 2
    }
    if (b == 2) {
        // Если остаток равен 2, ничего не делать
        return 3.0.pow(a).toInt() * 2 * 2
    }
    // Если остаток равен 0, ничего не делать
    return 3.0.pow(a).toInt()
}

/* Driver Code */
fun main() {
    val n = 58

    // Жадный алгоритм
    val res = maxProductCutting(n)
    println("Максимальное произведение после разрезания = $res")
}
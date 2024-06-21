/**
 * File: max_product_cutting.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.pow

/* 最大切分乘积：贪心 */
fun maxProductCutting(n: Int): Int {
    // 当 n <= 3 时，必须切分出一个 1
    if (n <= 3) {
        return 1 * (n - 1)
    }
    // 贪心地切分出 3 ，a 为 3 的个数，b 为余数
    val a = n / 3
    val b = n % 3
    if (b == 1) {
        // 当余数为 1 时，将一对 1 * 3 转化为 2 * 2
        return 3.0.pow((a - 1)).toInt() * 2 * 2
    }
    if (b == 2) {
        // 当余数为 2 时，不做处理
        return 3.0.pow(a).toInt() * 2 * 2
    }
    // 当余数为 0 时，不做处理
    return 3.0.pow(a).toInt()
}

/* Driver Code */
fun main() {
    val n = 58

    // 贪心算法
    val res = maxProductCutting(n)
    println("最大切分乘积为 $res")
}
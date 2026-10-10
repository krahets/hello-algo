/**
 * File: max_product_cutting.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.pow

/* 最大切断積：貪欲法 */
fun maxProductCutting(n: Int): Int {
    // n <= 3 のときは、必ず 1 を切り出す
    if (n <= 3) {
        return 1 * (n - 1)
    }
    // 貪欲に 3 を切り出し、a を 3 の個数、b を余りとする
    val a = n / 3
    val b = n % 3
    if (b == 1) {
        // 余りが 1 のときは、1 * 3 を 2 * 2 に変える
        return 3.0.pow((a - 1)).toInt() * 2 * 2
    }
    if (b == 2) {
        // 余りが 2 のときは、そのままにする
        return 3.0.pow(a).toInt() * 2 * 2
    }
    // 余りが 0 のときは、そのままにする
    return 3.0.pow(a).toInt()
}

/* Driver Code */
fun main() {
    val n = 58

    // 貪欲法
    val res = maxProductCutting(n)
    println("最大分割積は $res")
}
/**
 * File: max_product_cutting.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.pow

/* 整数分割の最大積（貪欲法） */
fun maxProductCutting(n: Int): Int {
    // n <= 3 の場合は必ず 1 を切り出す
    if (n <= 3) {
        return 1 * (n - 1)
    }
    // 貪欲に 3 を切り出す。a は 3 の個数、b は余り
    val a = n / 3
    val b = n % 3
    if (b == 1) {
        // 余りが 1 なら、1 * 3 の組を 2 * 2 に置き換える
        return 3.0.pow((a - 1)).toInt() * 2 * 2
    }
    if (b == 2) {
        // 余りが 2 なら、そのままにする
        return 3.0.pow(a).toInt() * 2
    }
    // 余りが 0 なら、そのままにする
    return 3.0.pow(a).toInt()
}

/* 実行例 */
fun main() {
    val n = 58

    // 貪欲法
    val res = maxProductCutting(n)
    println("分割後の積の最大値は $res")
}
/**
 * File: max_product_cutting.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.pow

/* 最大切分乘積：貪婪 */
fun maxProductCutting(n: Int): Int {
    // 當 n <= 3 時，必須切分出一個 1
    if (n <= 3) {
        return 1 * (n - 1)
    }
    // 貪婪地切分出 3 ，a 為 3 的個數，b 為餘數
    val a = n / 3
    val b = n % 3
    if (b == 1) {
        // 當餘數為 1 時，將一對 1 * 3 轉化為 2 * 2
        return 3.0.pow((a - 1)).toInt() * 2 * 2
    }
    if (b == 2) {
        // 當餘數為 2 時，不做處理
        return 3.0.pow(a).toInt() * 2 * 2
    }
    // 當餘數為 0 時，不做處理
    return 3.0.pow(a).toInt()
}

/* Driver Code */
fun main() {
    val n = 58

    // 貪婪演算法
    val res = maxProductCutting(n)
    println("最大切分乘積為 $res")
}
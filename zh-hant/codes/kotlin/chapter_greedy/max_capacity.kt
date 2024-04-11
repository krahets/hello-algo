/**
 * File: max_capacity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.max
import kotlin.math.min

/* 最大容量：貪婪 */
fun maxCapacity(ht: IntArray): Int {
    // 初始化 i, j，使其分列陣列兩端
    var i = 0
    var j = ht.size - 1
    // 初始最大容量為 0
    var res = 0
    // 迴圈貪婪選擇，直至兩板相遇
    while (i < j) {
        // 更新最大容量
        val cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // 向內移動短板
        if (ht[i] < ht[j]) {
            i++
        } else {
            j--
        }
    }
    return res
}

/* Driver Code */
fun main() {
    val ht = intArrayOf(3, 8, 5, 2, 7, 7, 3, 4)

    // 貪婪演算法
    val res = maxCapacity(ht)
    println("最大容量為 $res")
}
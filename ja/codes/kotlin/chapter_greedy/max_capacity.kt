/**
 * File: max_capacity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.max
import kotlin.math.min

/* 最大容量：貪欲法 */
fun maxCapacity(ht: IntArray): Int {
    // i, j を初期化し、配列の両端をそれぞれ指すようにする
    var i = 0
    var j = ht.size - 1
    // 最大容量の初期値は 0
    var res = 0
    // 2 枚の板が出会うまで貪欲な選択を繰り返す
    while (i < j) {
        // 最大容量を更新する
        val cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // 低い方の仕切り板を内側に移動する
        if (ht[i] < ht[j]) {
            i++
        } else {
            j--
        }
    }
    return res
}

/* 実行用コード */
fun main() {
    val ht = intArrayOf(3, 8, 5, 2, 7, 7, 3, 4)

    // 貪欲アルゴリズム
    val res = maxCapacity(ht)
    println("最大容量は $res")
}
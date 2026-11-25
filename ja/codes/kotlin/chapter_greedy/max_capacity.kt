/**
 * File: max_capacity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import kotlin.math.max
import kotlin.math.min

/* 最大容量（貪欲法） */
fun maxCapacity(ht: IntArray): Int {
    // i と j を配列の両端に置く
    var i = 0
    var j = ht.size - 1
    // 最大容量の初期値は 0
    var res = 0
    // 両方の板が同じ位置に来るまで貪欲選択を繰り返す
    while (i < j) {
        // 最大容量を更新する
        val cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        // 低い板のポインタを内側へ動かす
        if (ht[i] < ht[j]) {
            i++
        } else {
            j--
        }
    }
    return res
}

/* 実行例 */
fun main() {
    val ht = intArrayOf(3, 8, 5, 2, 7, 7, 3, 4)

    // 貪欲法
    val res = maxCapacity(ht)
    println("最大容量は $res")
}
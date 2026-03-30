/**
 * File: fractional_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* 品物 */
class Item(
    val w: Int, // 品物
    val v: Int  // 品物の価値
)

/* 分数ナップサック：貪欲法 */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // 重さと価値の 2 属性を持つ品物リストを作成
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // 単位価値 item.v / item.w の高い順にソートする
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // 貪欲選択を繰り返す
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
            res += item.v
            cap -= item.w
        } else {
            // 残り容量が足りない場合は、現在の品物の一部だけをナップサックに入れる
            res += item.v.toDouble() / item.w * cap
            // 残り容量がないため、ループを抜ける
            break
        }
    }
    return res
}

/* Driver Code */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50

    // 貪欲法
    val res = fractionalKnapsack(wgt, _val, cap)
    println("ナップサック容量を超えない最大価値は $res")
}
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

/* 分割可能ナップサック問題：貪欲法 */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // 重さと価値の 2 つの属性を持つ品物のリストを作成する
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // 単位重さ当たりの価値 item.v / item.w の降順にソートする
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // 貪欲な選択を繰り返す
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // 残り容量が十分なら、現在の品物を丸ごとナップサックに入れる
            res += item.v
            cap -= item.w
        } else {
            // 残り容量が不足している場合、現在の品物の一部をナップサックに入れる
            res += item.v.toDouble() / item.w * cap
            // 残り容量がないため、ループを終了する
            break
        }
    }
    return res
}

/* 実行用コード */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50

    // 貪欲アルゴリズム
    val res = fractionalKnapsack(wgt, _val, cap)
    println("ナップサックの容量を超えない品物の最大価値は $res")
}
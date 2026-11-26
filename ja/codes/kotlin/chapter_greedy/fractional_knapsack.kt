/**
 * File: fractional_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* 品物 */
class Item(
    val w: Int, // 品物の重さ
    val v: Int  // 品物の価値
)

/* 分割可能ナップサック（貪欲法） */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // 重さと価値の 2 つの属性を持つ品物のリストを作る
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // 単位重量あたりの価値 item.v / item.w の降順にソートする
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // 貪欲選択を繰り返す
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // 残り容量が十分なら、現在の品物を丸ごと入れる
            res += item.v
            cap -= item.w
        } else {
            // 残り容量が足りなければ、現在の品物の一部を入れる
            res += item.v.toDouble() / item.w * cap
            // 残り容量がないためループを抜ける
            break
        }
    }
    return res
}

/* 実行例 */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50

    // 貪欲法
    val res = fractionalKnapsack(wgt, _val, cap)
    println("容量内で得られる品物の合計価値の最大値は $res")
}
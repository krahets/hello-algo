/**
 * File: fractional_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* 物品 */
class Item(
    val w: Int, // 物品重量
    val v: Int  // 物品價值
)

/* 分數背包：貪婪法 */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // 建立物品清單，每件物品有重量與價值兩項屬性
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // 依單位價值 item.v / item.w 由高到低排序
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // 反覆依貪婪策略選取物品
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // 若剩餘容量足夠，就將目前的物品整件裝入背包
            res += item.v
            cap -= item.w
        } else {
            // 若剩餘容量不足，就將目前物品的一部分裝入背包
            res += item.v.toDouble() / item.w * cap
            // 背包已滿，跳出迴圈
            break
        }
    }
    return res
}

/* 主程式 */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50

    // 貪婪演算法
    val res = fractionalKnapsack(wgt, _val, cap)
    println("在背包容量限制內，物品的最大總價值為 $res")
}
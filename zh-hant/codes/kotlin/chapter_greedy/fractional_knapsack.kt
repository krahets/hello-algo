/**
 * File: fractional_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* 物品 */
class Item(
    val w: Int, // 物品
    val v: Int  // 物品價值
)

/* 分數背包：貪婪 */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // 建立物品串列，包含兩個屬性：重量、價值
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // 按照單位價值 item.v / item.w 從高到低進行排序
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // 迴圈貪婪選擇
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // 若剩餘容量充足，則將當前物品整個裝進背包
            res += item.v
            cap -= item.w
        } else {
            // 若剩餘容量不足，則將當前物品的一部分裝進背包
            res += item.v.toDouble() / item.w * cap
            // 已無剩餘容量，因此跳出迴圈
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

    // 貪婪演算法
    val res = fractionalKnapsack(wgt, _val, cap)
    println("不超過背包容量的最大物品價值為 $res")
}
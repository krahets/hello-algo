/**
 * File: fractional_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

import java.util.*

/* 物品 */
class Item(
    val w: Int, // 物品
    val v: Int // 物品价值
)

/* 分数背包：贪心 */
fun fractionalKnapsack(
    wgt: IntArray,
    value: IntArray,
    c: Int
): Double {
    // 创建物品列表，包含两个属性：重量、价值
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], value[i])
    }
    // 按照单位价值 item.v / item.w 从高到低进行排序
    Arrays.sort(items, Comparator.comparingDouble { item: Item -> -(item.v.toDouble() / item.w) })
    // 循环贪心选择
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // 若剩余容量充足，则将当前物品整个装进背包
            res += item.v.toDouble()
            cap -= item.w
        } else {
            // 若剩余容量不足，则将当前物品的一部分装进背包
            res += item.v.toDouble() / item.w * cap
            // 已无剩余容量，因此跳出循环
            break
        }
    }
    return res
}

/* Driver Code */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val values = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50

    // 贪心算法
    val res = fractionalKnapsack(wgt, values, cap)
    println("不超过背包容量的最大物品价值为 $res")
}
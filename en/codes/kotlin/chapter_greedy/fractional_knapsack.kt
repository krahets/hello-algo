/**
 * File: fractional_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* Item */
class Item(
    val w: Int, // Item
    val v: Int  // Item value
)

/* Fractional knapsack: Greedy */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // Create an item list, containing two properties: weight, value
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // Sort by unit value item.v / item.w from high to low
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // Loop for greedy selection
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // If the remaining capacity is sufficient, put the entire item into the knapsack
            res += item.v
            cap -= item.w
        } else {
            // If the remaining capacity is insufficient, put part of the item into the knapsack
            res += item.v.toDouble() / item.w * cap
            // No remaining capacity left, thus break the loop
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

    // Greedy algorithm
    val res = fractionalKnapsack(wgt, _val, cap)
    println("Maximum value of items without exceeding bag capacity = $res")
}
/**
 * File: fractional_knapsack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* Item */
class Item(
    val w: Int, // Item weight
    val v: Int  // Item value
)

/* Fractional knapsack: greedy algorithm */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // Create a list of items, each with two attributes: weight and value
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // Sort by value per unit weight, item.v / item.w, in descending order
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // Repeatedly make greedy choices
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // If enough capacity remains, put the entire current item in the knapsack
            res += item.v
            cap -= item.w
        } else {
            // If the remaining capacity is insufficient, put part of the current item in the knapsack
            res += item.v.toDouble() / item.w * cap
            // No capacity remains, so exit the loop
            break
        }
    }
    return res
}

/* Driver code */
fun main() {
    val wgt = intArrayOf(10, 20, 30, 40, 50)
    val _val = intArrayOf(50, 120, 150, 210, 240)
    val cap = 50

    // Greedy algorithm
    val res = fractionalKnapsack(wgt, _val, cap)
    println("Maximum total item value within the knapsack capacity: $res")
}
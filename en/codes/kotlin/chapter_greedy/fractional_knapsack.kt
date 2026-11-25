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

/* Greedy fractional knapsack */
fun fractionalKnapsack(wgt: IntArray, _val: IntArray, c: Int): Double {
    // Create a list of items, each with a weight and a value
    var cap = c
    val items = arrayOfNulls<Item>(wgt.size)
    for (i in wgt.indices) {
        items[i] = Item(wgt[i], _val[i])
    }
    // Sort by value per unit of weight, item.v / item.w, in descending order
    items.sortBy { item: Item? -> -(item!!.v.toDouble() / item.w) }
    // Make greedy choices in a loop
    var res = 0.0
    for (item in items) {
        if (item!!.w <= cap) {
            // If the whole item fits, put it in the knapsack
            res += item.v
            cap -= item.w
        } else {
            // If the whole item does not fit, take a fraction of it
            res += item.v.toDouble() / item.w * cap
            // The knapsack is full, so exit the loop
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
    println("The maximum total value within the weight limit is $res")
}
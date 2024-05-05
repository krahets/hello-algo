/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* Coin change: Greedy */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // Assume coins list is ordered
    var am = amt
    var i = coins.size - 1
    var count = 0
    // Loop for greedy selection until no remaining amount
    while (am > 0) {
        // Find the smallest coin close to and less than the remaining amount
        while (i > 0 && coins[i] > am) {
            i--
        }
        // Choose coins[i]
        am -= coins[i]
        count++
    }
    // If no feasible solution is found, return -1
    return if (am == 0) count else -1
}

/* Driver Code */
fun main() {
    // Greedy: can ensure finding a global optimal solution
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Minimum number of coins required to make up $amt = $res")

    // Greedy: cannot ensure finding a global optimal solution
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Minimum number of coins required to make up $amt = $res")
    println("In reality, the minimum number needed is 3, i.e., 20 + 20 + 20")

    // Greedy: cannot ensure finding a global optimal solution
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Minimum number of coins required to make up $amt = $res")
    println("In reality, the minimum number needed is 2, i.e., 49 + 49")
}
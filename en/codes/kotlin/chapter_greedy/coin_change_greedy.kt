/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* Coin change: Greedy algorithm */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // Assume coins list is sorted
    var am = amt
    var i = coins.size - 1
    var count = 0
    // Loop to make greedy choices until no remaining amount
    while (am > 0) {
        // Find the coin that is less than and closest to the remaining amount
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
    // Greedy algorithm: Can guarantee finding the global optimal solution
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Minimum coins needed to make $amt is $res")

    // Greedy algorithm: Cannot guarantee finding the global optimal solution
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Minimum coins needed to make $amt is $res")
    println("Actually the minimum number needed is 3, i.e., 20 + 20 + 20")

    // Greedy algorithm: Cannot guarantee finding the global optimal solution
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("Minimum coins needed to make $amt is $res")
    println("Actually the minimum number needed is 2, i.e., 49 + 49")
}
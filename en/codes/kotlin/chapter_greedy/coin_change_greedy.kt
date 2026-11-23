/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* Coin change: greedy algorithm */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // Assume coins is sorted in ascending order
    var am = amt
    var i = coins.size - 1
    var count = 0
    // Repeatedly make greedy choices until no amount remains
    while (am > 0) {
        // Find the largest coin no greater than the remaining amount
        while (i > 0 && coins[i] > am) {
            i--
        }
        // Choose coins[i]
        am -= coins[i]
        count++
    }
    // Return -1 if no feasible solution was found
    return if (am == 0) count else -1
}

/* Driver code */
fun main() {
    // Greedy algorithm: guaranteed to find a globally optimal solution
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("For amount $amt, the greedy coin count is $res")

    // Greedy algorithm: not guaranteed to find a globally optimal solution
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("For amount $amt, the greedy coin count is $res")
    println("The actual minimum is 3 coins: 20 + 20 + 20")

    // Greedy algorithm: not guaranteed to find a globally optimal solution
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("For amount $amt, the greedy coin count is $res")
    println("The actual minimum is 2 coins: 49 + 49")
}
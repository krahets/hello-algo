/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* Greedy coin change */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // Assume the coins list is sorted
    var am = amt
    var i = coins.size - 1
    var count = 0
    // Make greedy choices until no amount remains
    while (am > 0) {
        // Find the largest denomination that does not exceed the remaining amount
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
    // Greedy choices are guaranteed to give a global optimum here
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("The minimum number of coins needed to make $amt is $res")

    // Greedy choices do not guarantee a global optimum here
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("The minimum number of coins needed to make $amt is $res")
    println("The actual minimum is 3 coins: 20 + 20 + 20")

    // Greedy choices do not guarantee a global optimum here
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("The minimum number of coins needed to make $amt is $res")
    println("The actual minimum is 2 coins: 49 + 49")
}
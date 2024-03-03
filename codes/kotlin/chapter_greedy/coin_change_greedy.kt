/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* 零钱兑换：贪心 */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // 假设 coins 列表有序
    var am = amt
    var i = coins.size - 1
    var count = 0
    // 循环进行贪心选择，直到无剩余金额
    while (am > 0) {
        // 找到小于且最接近剩余金额的硬币
        while (i > 0 && coins[i] > am) {
            i--
        }
        // 选择 coins[i]
        am -= coins[i]
        count++
    }
    // 若未找到可行方案，则返回 -1
    return if (am == 0) count else -1
}

/* Driver Code */
fun main() {
    // 贪心：能够保证找到全局最优解
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("凑到 $amt 所需的最少硬币数量为 $res")

    // 贪心：无法保证找到全局最优解
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("凑到 $amt 所需的最少硬币数量为 $res")
    println("实际上需要的最少数量为 3 ，即 20 + 20 + 20")

    // 贪心：无法保证找到全局最优解
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("凑到 $amt 所需的最少硬币数量为 $res")
    println("实际上需要的最少数量为 2 ，即 49 + 49")
}
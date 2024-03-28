/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* 零錢兌換：貪婪 */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // 假設 coins 串列有序
    var am = amt
    var i = coins.size - 1
    var count = 0
    // 迴圈進行貪婪選擇，直到無剩餘金額
    while (am > 0) {
        // 找到小於且最接近剩餘金額的硬幣
        while (i > 0 && coins[i] > am) {
            i--
        }
        // 選擇 coins[i]
        am -= coins[i]
        count++
    }
    // 若未找到可行方案，則返回 -1
    return if (am == 0) count else -1
}

/* Driver Code */
fun main() {
    // 貪婪：能夠保證找到全域性最優解
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("湊到 $amt 所需的最少硬幣數量為 $res")

    // 貪婪：無法保證找到全域性最優解
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("湊到 $amt 所需的最少硬幣數量為 $res")
    println("實際上需要的最少數量為 3 ，即 20 + 20 + 20")

    // 貪婪：無法保證找到全域性最優解
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("湊到 $amt 所需的最少硬幣數量為 $res")
    println("實際上需要的最少數量為 2 ，即 49 + 49")
}
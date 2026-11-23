/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* 硬貨の両替：貪欲法 */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // coins リストはソート済みと仮定する
    var am = amt
    var i = coins.size - 1
    var count = 0
    // 残額がなくなるまで貪欲な選択を繰り返す
    while (am > 0) {
        // 残額より小さく、残額に最も近い硬貨を探す
        while (i > 0 && coins[i] > am) {
            i--
        }
        // coins[i] を選ぶ
        am -= coins[i]
        count++
    }
    // 実行可能な方法が見つからなかった場合、-1 を返す
    return if (am == 0) count else -1
}

/* 実行用コード */
fun main() {
    // 貪欲法：大域的最適解が得られることを保証できる
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("$amt にするために必要な硬貨の最小枚数は $res")

    // 貪欲法：大域的最適解が得られることを保証できない
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("$amt にするために必要な硬貨の最小枚数は $res")
    println("実際に必要な最小枚数は 3 、すなわち 20 + 20 + 20")

    // 貪欲法：大域的最適解が得られることを保証できない
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("$amt にするために必要な硬貨の最小枚数は $res")
    println("実際に必要な最小枚数は 2 、すなわち 49 + 49")
}
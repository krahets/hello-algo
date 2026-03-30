/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* コイン交換：貪欲法 */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // coins リストはソート済みと仮定する
    var am = amt
    var i = coins.size - 1
    var count = 0
    // 残額がなくなるまで貪欲選択を繰り返す
    while (am > 0) {
        // 残額以下で最も近い硬貨を見つける
        while (i > 0 && coins[i] > am) {
            i--
        }
        // coins[i] を選択する
        am -= coins[i]
        count++
    }
    // 実行可能な解が見つからなければ -1 を返す
    return if (am == 0) count else -1
}

/* Driver Code */
fun main() {
    // 貪欲法：大域最適解を保証できる
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("$amt を作るのに必要な最小硬貨枚数は $res")

    // 貪欲法：大域最適解を保証できない
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("$amt を作るのに必要な最小硬貨枚数は $res")
    println("実際に必要な最小枚数は 3、つまり 20 + 20 + 20")

    // 貪欲法：大域最適解を保証できない
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("$amt を作るのに必要な最小硬貨枚数は $res")
    println("実際に必要な最小枚数は 2、つまり 49 + 49")
}
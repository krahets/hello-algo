/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* 硬貨の両替（貪欲法） */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // リスト coins はソート済みとする
    var am = amt
    var i = coins.size - 1
    var count = 0
    // 残額がなくなるまで貪欲選択を繰り返す
    while (am > 0) {
        // 残額より小さく、最も近い額面の硬貨を探す
        while (i > 0 && coins[i] > am) {
            i--
        }
        // coins[i] を選ぶ
        am -= coins[i]
        count++
    }
    // 解が見つからなければ -1 を返す
    return if (am == 0) count else -1
}

/* 実行例 */
fun main() {
    // 貪欲法で大域的最適解が必ず求まる例
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("金額 $amt を作るのに必要な硬貨の最少枚数は $res")

    // 貪欲法では大域的最適解を保証できない例
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("金額 $amt を作るのに必要な硬貨の最少枚数は $res")
    println("実際の最少枚数は 3 枚（20 + 20 + 20）")

    // 貪欲法では大域的最適解を保証できない例
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("金額 $amt を作るのに必要な硬貨の最少枚数は $res")
    println("実際の最少枚数は 2 枚（49 + 49）")
}
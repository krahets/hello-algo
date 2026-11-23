/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* 동전 교환: 탐욕 */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // coins 리스트가 정렬되어 있다고 가정한다
    var am = amt
    var i = coins.size - 1
    var count = 0
    // 남은 금액이 없을 때까지 탐욕적 선택을 반복한다
    while (am > 0) {
        // 남은 금액보다 작으면서 가장 가까운 금액의 동전을 찾는다
        while (i > 0 && coins[i] > am) {
            i--
        }
        // coins[i]를 선택한다
        am -= coins[i]
        count++
    }
    // 가능한 방법을 찾지 못하면 -1을 반환한다
    return if (am == 0) count else -1
}

/* 실행 코드 */
fun main() {
    // 탐욕: 전역 최적해를 찾는 것이 보장된다
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("목표 금액 = $amt, 필요한 최소 동전 개수 = $res")

    // 탐욕: 전역 최적해를 찾는 것이 보장되지 않는다
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("목표 금액 = $amt, 필요한 최소 동전 개수 = $res")
    println("실제로 필요한 최소 개수는 3개이며, 20 + 20 + 20이다")

    // 탐욕: 전역 최적해를 찾는 것이 보장되지 않는다
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("목표 금액 = $amt, 필요한 최소 동전 개수 = $res")
    println("실제로 필요한 최소 개수는 2개이며, 49 + 49이다")
}
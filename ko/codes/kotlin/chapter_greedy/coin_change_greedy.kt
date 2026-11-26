/**
 * File: coin_change_greedy.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_greedy

/* 탐욕 알고리즘으로 거스름돈 만들기 */
fun coinChangeGreedy(coins: IntArray, amt: Int): Int {
    // coins 리스트는 오름차순으로 정렬되어 있다고 가정한다
    var am = amt
    var i = coins.size - 1
    var count = 0
    // 남은 금액이 없어질 때까지 탐욕 선택을 반복한다
    while (am > 0) {
        // 남은 금액을 넘지 않는 가장 큰 액면가의 동전을 찾는다
        while (i > 0 && coins[i] > am) {
            i--
        }
        // coins[i] 선택
        am -= coins[i]
        count++
    }
    // 가능한 방법을 찾지 못하면 -1을 반환한다
    return if (am == 0) count else -1
}

/* 실행 예제 */
fun main() {
    // 탐욕 선택이 전역 최적해를 보장하는 경우
    var coins = intArrayOf(1, 5, 10, 20, 50, 100)
    var amt = 186
    var res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("목표 금액 $amt, 필요한 최소 동전 수: $res")

    // 탐욕 선택이 전역 최적해를 보장하지 않는 경우
    coins = intArrayOf(1, 20, 50)
    amt = 60
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("목표 금액 $amt, 필요한 최소 동전 수: $res")
    println("실제로는 20 + 20 + 20으로 최소 3개가 필요하다")

    // 탐욕 선택이 전역 최적해를 보장하지 않는 경우
    coins = intArrayOf(1, 49, 50)
    amt = 98
    res = coinChangeGreedy(coins, amt)
    println("\ncoins = ${coins.contentToString()}, amt = $amt")
    println("목표 금액 $amt, 필요한 최소 동전 수: $res")
    println("실제로는 49 + 49로 최소 2개가 필요하다")
}
/**
 * File: climbing_stairs_backtrack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* 백트래킹 */
fun backtrack(
    choices: MutableList<Int>,
    state: Int,
    n: Int,
    res: MutableList<Int>
) {
    // n번째 계단에 도달하면 방법의 수에 1을 더한다
    if (state == n)
        res[0] = res[0] + 1
    // 모든 선택지를 순회한다
    for (choice in choices) {
        // 가지치기: n번째 계단을 넘어갈 수 없다
        if (state + choice > n) continue
        // 시도: 선택하고 상태를 갱신한다
        backtrack(choices, state + choice, n, res)
        // 되돌리기
    }
}

/* 계단 오르기: 백트래킹 */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // 한 계단 또는 두 계단 오르기를 선택할 수 있다
    val state = 0 // 0번째 계단에서 오르기 시작한다
    val res = mutableListOf<Int>()
    res.add(0) // res[0]에 방법의 수를 기록한다
    backtrack(choices, state, n, res)
    return res[0]
}

/* 실행 코드 */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("계단 수 n = $n, 오르는 방법의 수 = $res")
}
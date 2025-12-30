/**
 * File: climbing_stairs_backtrack.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_dynamic_programming

/* Backtracking */
fun backtrack(
    choices: MutableList<Int>,
    state: Int,
    n: Int,
    res: MutableList<Int>
) {
    // When climbing to the n-th stair, add 1 to the solution count
    if (state == n)
        res[0] = res[0] + 1
    // Traverse all choices
    for (choice in choices) {
        // Pruning: not allowed to go beyond the n-th stair
        if (state + choice > n) continue
        // Attempt: make choice, update state
        backtrack(choices, state + choice, n, res)
        // Backtrack
    }
}

/* Climbing stairs: Backtracking */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // Can choose to climb up 1 or 2 stairs
    val state = 0 // Start climbing from the 0-th stair
    val res = mutableListOf<Int>()
    res.add(0) // Use res[0] to record the solution count
    backtrack(choices, state, n, res)
    return res[0]
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("Climbing $n stairs has $res solutions")
}
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
    // Count one more way when we reach stair n
    if (state == n)
        res[0] = res[0] + 1
    // Iterate over all choices
    for (choice in choices) {
        // Prune moves that would overshoot stair n
        if (state + choice > n) continue
        // Try a choice and update the state
        backtrack(choices, state + choice, n, res)
        // Undo the choice
    }
}

/* Climbing stairs with backtracking */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // Each move can climb 1 or 2 stairs
    val state = 0 // Start at stair 0
    val res = mutableListOf<Int>()
    res.add(0) // Store the number of ways in res[0]
    backtrack(choices, state, n, res)
    return res[0]
}

/* Driver code */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("Climbing $n stairs: $res ways")
}
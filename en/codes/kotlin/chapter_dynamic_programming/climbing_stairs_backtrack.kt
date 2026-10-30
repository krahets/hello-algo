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
    // When step n is reached, increase the number of ways by 1
    if (state == n)
        res[0] = res[0] + 1
    // Iterate over all choices
    for (choice in choices) {
        // Prune: do not go beyond step n
        if (state + choice > n) continue
        // Try: make a choice and update the state
        backtrack(choices, state + choice, n, res)
        // Backtrack
    }
}

/* Climbing stairs: backtracking */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // Choose to climb 1 or 2 steps
    val state = 0 // Start climbing from step 0
    val res = mutableListOf<Int>()
    res.add(0) // Use res[0] to record the number of ways
    backtrack(choices, state, n, res)
    return res[0]
}

/* Driver code */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("There are $res ways to climb $n stairs")
}
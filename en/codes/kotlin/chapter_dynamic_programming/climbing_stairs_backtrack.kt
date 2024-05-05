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
    // When climbing to the nth step, add 1 to the number of solutions
    if (state == n)
        res[0] = res[0] + 1
    // Traverse all choices
    for (choice in choices) {
        // Pruning: do not allow climbing beyond the nth step
        if (state + choice > n) continue
        // Attempt: make a choice, update the state
        backtrack(choices, state + choice, n, res)
        // Retract
    }
}

/* Climbing stairs: Backtracking */
fun climbingStairsBacktrack(n: Int): Int {
    val choices = mutableListOf(1, 2) // Can choose to climb up 1 step or 2 steps
    val state = 0 // Start climbing from the 0th step
    val res = mutableListOf<Int>()
    res.add(0) // Use res[0] to record the number of solutions
    backtrack(choices, state, n, res)
    return res[0]
}

/* Driver Code */
fun main() {
    val n = 9

    val res = climbingStairsBacktrack(n)
    println("There are $res solutions to climb $n stairs")
}
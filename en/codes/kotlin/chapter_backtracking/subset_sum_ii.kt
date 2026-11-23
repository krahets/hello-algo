/**
 * File: subset_sum_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_ii

/* Backtracking: subset sum II */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    choices: IntArray,
    start: Int,
    res: MutableList<MutableList<Int>?>
) {
    // Record a solution when the subset reaches the original target (remaining target is 0)
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // Iterate over all choices
    // Pruning 2: iterate from start to avoid generating duplicate subsets
    // Pruning 3: start after the previously chosen index to avoid choosing the same element again
    for (i in start..<choices.size) {
        // Pruning 1: exit the loop if this choice would exceed the remaining target
        // The array is sorted, so later elements are at least as large and would also exceed the remaining target
        if (target - choices[i] < 0) {
            break
        }
        // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
        if (i > start && choices[i] == choices[i - 1]) {
            continue
        }
        // Try: make a choice and update target and start
        state.add(choices[i])
        // Proceed to the next choice
        backtrack(state, target - choices[i], choices, i + 1, res)
        // Backtrack: undo the choice and restore the previous state
        state.removeAt(state.size - 1)
    }
}

/* Solve subset sum II */
fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // State (subset)
    nums.sort() // Sort nums
    val start = 0 // Starting index for iteration
    val res = mutableListOf<MutableList<Int>?>() // Result list (list of subsets)
    backtrack(state, target, nums, start, res)
    return res
}

/* Driver code */
fun main() {
    val nums = intArrayOf(4, 4, 5)
    val target = 9
    val res = subsetSumII(nums, target)

    println("Input array nums = ${nums.contentToString()}, target = $target")
    println("All subsets with sum $target: res = $res")
}
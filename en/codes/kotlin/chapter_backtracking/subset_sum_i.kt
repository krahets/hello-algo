/**
 * File: subset_sum_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i

/* Backtracking: subset sum I */
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
    for (i in start..<choices.size) {
        // Pruning 1: exit the loop if this choice would exceed the remaining target
        // The array is sorted, so later elements are at least as large and would also exceed the remaining target
        if (target - choices[i] < 0) {
            break
        }
        // Try: make a choice and update target and start
        state.add(choices[i])
        // Proceed to the next choice
        backtrack(state, target - choices[i], choices, i, res)
        // Backtrack: undo the choice and restore the previous state
        state.removeAt(state.size - 1)
    }
}

/* Solve subset sum I */
fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // State (subset)
    nums.sort() // Sort nums
    val start = 0 // Starting index for iteration
    val res = mutableListOf<MutableList<Int>?>() // Result list (list of subsets)
    backtrack(state, target, nums, start, res)
    return res
}

/* Driver code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9

    val res = subsetSumI(nums, target)

    println("Input array nums = ${nums.contentToString()}, target = $target")
    println("All subsets with sum $target: res = $res")
}
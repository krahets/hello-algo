/**
 * File: subset_sum_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i

/* Backtracking algorithm: Subset sum I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    choices: IntArray,
    start: Int,
    res: MutableList<MutableList<Int>?>
) {
    // When the subset sum equals target, record the solution
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // Traverse all choices
    // Pruning 2: start traversing from start to avoid generating duplicate subsets
    for (i in start..<choices.size) {
        // Pruning 1: if the subset sum exceeds target, end the loop directly
        // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if (target - choices[i] < 0) {
            break
        }
        // Attempt: make choice, update target, start
        state.add(choices[i])
        // Proceed to the next round of selection
        backtrack(state, target - choices[i], choices, i, res)
        // Backtrack: undo choice, restore to previous state
        state.removeAt(state.size - 1)
    }
}

/* Solve subset sum I */
fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // State (subset)
    nums.sort() // Sort nums
    val start = 0 // Start point for traversal
    val res = mutableListOf<MutableList<Int>?>() // Result list (subset list)
    backtrack(state, target, nums, start, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9

    val res = subsetSumI(nums, target)

    println("Input array nums = ${nums.contentToString()}, target = $target")
    println("All subsets with sum equal to $target res = $res")
}
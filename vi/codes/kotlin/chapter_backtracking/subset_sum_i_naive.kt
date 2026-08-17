/**
 * File: subset_sum_i_native.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i_naive

/* Backtracking algorithm: Subset sum I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    total: Int,
    choices: IntArray,
    res: MutableList<MutableList<Int>?>
) {
    // When the subset sum equals target, record the solution
    if (total == target) {
        res.add(state.toMutableList())
        return
    }
    // Traverse all choices
    for (i in choices.indices) {
        // Pruning: if the subset sum exceeds target, skip this choice
        if (total + choices[i] > target) {
            continue
        }
        // Attempt: make choice, update element sum total
        state.add(choices[i])
        // Proceed to the next round of selection
        backtrack(state, target, total + choices[i], choices, res)
        // Backtrack: undo choice, restore to previous state
        state.removeAt(state.size - 1)
    }
}

/* Solve subset sum I (including duplicate subsets) */
fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // State (subset)
    val total = 0 // Subset sum
    val res = mutableListOf<MutableList<Int>?>() // Result list (subset list)
    backtrack(state, target, total, nums, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9
    val res = subsetSumINaive(nums, target)

    println("Input array nums = ${nums.contentToString()}, target = $target")
    println("All subsets with sum equal to $target res = $res")
    println("Please note that this method outputs results containing duplicate sets")
}
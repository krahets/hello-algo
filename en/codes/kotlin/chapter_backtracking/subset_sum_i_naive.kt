/**
 * File: subset_sum_i_native.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i_naive

/* Backtracking: subset sum I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    total: Int,
    choices: IntArray,
    res: MutableList<MutableList<Int>?>
) {
    // Record a solution when the subset sum equals target
    if (total == target) {
        res.add(state.toMutableList())
        return
    }
    // Iterate over all choices
    for (i in choices.indices) {
        // Prune: skip this choice if the subset sum would exceed target
        if (total + choices[i] > target) {
            continue
        }
        // Try: make a choice and update the sum total
        state.add(choices[i])
        // Proceed to the next choice
        backtrack(state, target, total + choices[i], choices, res)
        // Backtrack: undo the choice and restore the previous state
        state.removeAt(state.size - 1)
    }
}

/* Solve subset sum I (with duplicate subsets) */
fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // State (subset)
    val total = 0 // Subset sum
    val res = mutableListOf<MutableList<Int>?>() // Result list (list of subsets)
    backtrack(state, target, total, nums, res)
    return res
}

/* Driver code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9
    val res = subsetSumINaive(nums, target)

    println("Input array nums = ${nums.contentToString()}, target = $target")
    println("All subsets with sum $target: res = $res")
    println("Note that this method produces duplicate subsets")
}
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
    // Record a solution when the subset sums to target
    if (total == target) {
        res.add(state.toMutableList())
        return
    }
    // Try each choice
    for (i in choices.indices) {
        // Prune: skip choices that would take the subset sum over target
        if (total + choices[i] > target) {
            continue
        }
        // Make a choice and update the running sum total
        state.add(choices[i])
        // Make the next choice
        backtrack(state, target, total + choices[i], choices, res)
        // Backtrack: undo the choice to restore the previous state
        state.removeAt(state.size - 1)
    }
}

/* Solve subset sum I (including duplicate subsets) */
fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // State (current subset)
    val total = 0 // Subset sum
    val res = mutableListOf<MutableList<Int>?>() // Results (list of subsets)
    backtrack(state, target, total, nums, res)
    return res
}

/* Driver code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9
    val res = subsetSumINaive(nums, target)

    println("Input array nums = ${nums.contentToString()}, target = $target")
    println("Subsets that sum to $target: res = $res")
    println("This method returns duplicate subsets")
}
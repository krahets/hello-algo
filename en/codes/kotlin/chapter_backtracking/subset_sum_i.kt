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
    // Record a solution when the subset sums to target
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // Try each choice
    // Pruning rule 2: start at start to avoid duplicate subsets
    for (i in start..<choices.size) {
        // Pruning rule 1: break if the subset sum would exceed target
        // The array is sorted, so later elements are at least as large and would also take the sum over target
        if (target - choices[i] < 0) {
            break
        }
        // Make a choice and update target and start
        state.add(choices[i])
        // Make the next choice
        backtrack(state, target - choices[i], choices, i, res)
        // Backtrack: undo the choice to restore the previous state
        state.removeAt(state.size - 1)
    }
}

/* Solve subset sum I */
fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // State (current subset)
    nums.sort() // Sort nums
    val start = 0 // Starting index
    val res = mutableListOf<MutableList<Int>?>() // Results (list of subsets)
    backtrack(state, target, nums, start, res)
    return res
}

/* Driver code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9

    val res = subsetSumI(nums, target)

    println("Input array nums = ${nums.contentToString()}, target = $target")
    println("Subsets that sum to $target: res = $res")
}
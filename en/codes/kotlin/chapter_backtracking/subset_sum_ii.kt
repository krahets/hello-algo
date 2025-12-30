/**
 * File: subset_sum_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_ii

/* Backtracking algorithm: Subset sum II */
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
    // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
    for (i in start..<choices.size) {
        // Pruning 1: if the subset sum exceeds target, end the loop directly
        // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if (target - choices[i] < 0) {
            break
        }
        // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
        if (i > start && choices[i] == choices[i - 1]) {
            continue
        }
        // Attempt: make choice, update target, start
        state.add(choices[i])
        // Proceed to the next round of selection
        backtrack(state, target - choices[i], choices, i + 1, res)
        // Backtrack: undo choice, restore to previous state
        state.removeAt(state.size - 1)
    }
}

/* Solve subset sum II */
fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // State (subset)
    nums.sort() // Sort nums
    val start = 0 // Start point for traversal
    val res = mutableListOf<MutableList<Int>?>() // Result list (subset list)
    backtrack(state, target, nums, start, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 4, 5)
    val target = 9
    val res = subsetSumII(nums, target)

    println("Input array nums = ${nums.contentToString()}, target = $target")
    println("All subsets with sum equal to $target res = $res")
}
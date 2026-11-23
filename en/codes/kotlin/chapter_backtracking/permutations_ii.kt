/**
 * File: permutations_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_ii

/* Backtracking: permutations II */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // Record a solution when the state length equals the number of elements
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // Iterate over all choices
    val duplicated = HashSet<Int>()
    for (i in choices.indices) {
        val choice = choices[i]
        // Prune: do not reuse an element or choose the same value again at this depth
        if (!selected[i] && !duplicated.contains(choice)) {
            // Try: make a choice and update the state
            duplicated.add(choice) // Record the chosen value
            selected[i] = true
            state.add(choice)
            // Proceed to the next choice
            backtrack(state, choices, selected, res)
            // Backtrack: undo the choice and restore the previous state
            selected[i] = false
            state.removeAt(state.size - 1)
        }
    }
}

/* Permutations II */
fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* Driver code */
fun main() {
    val nums = intArrayOf(1, 2, 2)
    val res = permutationsII(nums)

    println("Input array nums = ${nums.contentToString()}")
    println("All permutations res = $res")
}
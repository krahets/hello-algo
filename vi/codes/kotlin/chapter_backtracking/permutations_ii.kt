/**
 * File: permutations_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_ii

/* Backtracking algorithm: Permutations II */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // When the state length equals the number of elements, record the solution
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // Traverse all choices
    val duplicated = HashSet<Int>()
    for (i in choices.indices) {
        val choice = choices[i]
        // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
        if (!selected[i] && !duplicated.contains(choice)) {
            // Attempt: make choice, update state
            duplicated.add(choice) // Record the selected element value
            selected[i] = true
            state.add(choice)
            // Proceed to the next round of selection
            backtrack(state, choices, selected, res)
            // Backtrack: undo choice, restore to previous state
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

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 2, 2)
    val res = permutationsII(nums)

    println("Input array nums = ${nums.contentToString()}")
    println("All permutations res = $res")
}
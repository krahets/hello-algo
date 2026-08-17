/**
 * File: permutations_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_i

/* Backtracking algorithm: Permutations I */
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
    for (i in choices.indices) {
        val choice = choices[i]
        // Pruning: do not allow repeated selection of elements
        if (!selected[i]) {
            // Attempt: make choice, update state
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

/* Permutations I */
fun permutationsI(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 2, 3)

    val res = permutationsI(nums)

    println("Input array nums = ${nums.contentToString()}")
    println("All permutations res = $res")
}
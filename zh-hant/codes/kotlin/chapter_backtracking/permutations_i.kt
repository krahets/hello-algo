/**
 * File: permutations_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_i

/* 回溯演算法：全排列 I */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // 當狀態長度等於元素數量時，記錄解
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // 走訪所有選擇
    for (i in choices.indices) {
        val choice = choices[i]
        // 剪枝：不允許重複選擇元素
        if (!selected[i]) {
            // 嘗試：做出選擇，更新狀態
            selected[i] = true
            state.add(choice)
            // 進行下一輪選擇
            backtrack(state, choices, selected, res)
            // 回退：撤銷選擇，恢復到之前的狀態
            selected[i] = false
            state.removeAt(state.size - 1)
        }
    }
}

/* 全排列 I */
fun permutationsI(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 2, 3)

    val res = permutationsI(nums)

    println("輸入陣列 nums = ${nums.contentToString()}")
    println("所有排列 res = $res")
}
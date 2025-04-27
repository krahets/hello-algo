/**
 * File: permutations_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_i

/* 回溯算法：全排列 I */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // 当状态长度等于元素数量时，记录解
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // 遍历所有选择
    for (i in choices.indices) {
        val choice = choices[i]
        // 剪枝：不允许重复选择元素
        if (!selected[i]) {
            // 尝试：做出选择，更新状态
            selected[i] = true
            state.add(choice)
            // 进行下一轮选择
            backtrack(state, choices, selected, res)
            // 回退：撤销选择，恢复到之前的状态
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

    println("输入数组 nums = ${nums.contentToString()}")
    println("所有排列 res = $res")
}
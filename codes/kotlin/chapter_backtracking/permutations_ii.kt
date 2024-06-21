/**
 * File: permutations_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_ii

/* 回溯算法：全排列 II */
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
    val duplicated = HashSet<Int>()
    for (i in choices.indices) {
        val choice = choices[i]
        // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
        if (!selected[i] && !duplicated.contains(choice)) {
            // 尝试：做出选择，更新状态
            duplicated.add(choice) // 记录选择过的元素值
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

/* 全排列 II */
fun permutationsII(nums: IntArray): MutableList<MutableList<Int>?> {
    val res = mutableListOf<MutableList<Int>?>()
    backtrack(mutableListOf(), nums, BooleanArray(nums.size), res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 2, 2)
    val res = permutationsII(nums)

    println("输入数组 nums = ${nums.contentToString()}")
    println("所有排列 res = $res")
}
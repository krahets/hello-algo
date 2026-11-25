/**
 * File: permutations_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.permutations_ii

/* 回溯演算法：全排列 II */
fun backtrack(
    state: MutableList<Int>,
    choices: IntArray,
    selected: BooleanArray,
    res: MutableList<MutableList<Int>?>
) {
    // 當狀態長度等於元素個數時，記錄此解
    if (state.size == choices.size) {
        res.add(state.toMutableList())
        return
    }
    // 逐一檢查所有選項
    val duplicated = HashSet<Int>()
    for (i in choices.indices) {
        val choice = choices[i]
        // 剪枝：不可重複選取同一個元素，同一層也不可重複選取相同的值
        if (!selected[i] && !duplicated.contains(choice)) {
            // 嘗試：做出選擇並更新狀態
            duplicated.add(choice) // 記錄已選過的元素值
            selected[i] = true
            state.add(choice)
            // 進入下一輪選擇
            backtrack(state, choices, selected, res)
            // 回溯：撤銷選擇，還原先前的狀態
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

/* 主程式 */
fun main() {
    val nums = intArrayOf(1, 2, 2)
    val res = permutationsII(nums)

    println("輸入陣列 nums = ${nums.contentToString()}")
    println("所有排列 res = $res")
}
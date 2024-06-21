/**
 * File: subset_sum_i.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i

/* 回溯演算法：子集和 I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    choices: IntArray,
    start: Int,
    res: MutableList<MutableList<Int>?>
) {
    // 子集和等於 target 時，記錄解
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // 走訪所有選擇
    // 剪枝二：從 start 開始走訪，避免生成重複子集
    for (i in start..<choices.size) {
        // 剪枝一：若子集和超過 target ，則直接結束迴圈
        // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
        if (target - choices[i] < 0) {
            break
        }
        // 嘗試：做出選擇，更新 target, start
        state.add(choices[i])
        // 進行下一輪選擇
        backtrack(state, target - choices[i], choices, i, res)
        // 回退：撤銷選擇，恢復到之前的狀態
        state.removeAt(state.size - 1)
    }
}

/* 求解子集和 I */
fun subsetSumI(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 狀態（子集）
    nums.sort() // 對 nums 進行排序
    val start = 0 // 走訪起始點
    val res = mutableListOf<MutableList<Int>?>() // 結果串列（子集串列）
    backtrack(state, target, nums, start, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9

    val res = subsetSumI(nums, target)

    println("輸入陣列 nums = ${nums.contentToString()}, target = $target")
    println("所有和等於 $target 的子集 res = $res")
}
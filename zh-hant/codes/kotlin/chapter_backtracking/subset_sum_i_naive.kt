/**
 * File: subset_sum_i_native.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i_naive

/* 回溯演算法：子集和 I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    total: Int,
    choices: IntArray,
    res: MutableList<MutableList<Int>?>
) {
    // 子集和等於 target 時，記錄解
    if (total == target) {
        res.add(state.toMutableList())
        return
    }
    // 走訪所有選擇
    for (i in choices.indices) {
        // 剪枝：若子集和超過 target ，則跳過該選擇
        if (total + choices[i] > target) {
            continue
        }
        // 嘗試：做出選擇，更新元素和 total
        state.add(choices[i])
        // 進行下一輪選擇
        backtrack(state, target, total + choices[i], choices, res)
        // 回退：撤銷選擇，恢復到之前的狀態
        state.removeAt(state.size - 1)
    }
}

/* 求解子集和 I（包含重複子集） */
fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 狀態（子集）
    val total = 0 // 子集和
    val res = mutableListOf<MutableList<Int>?>() // 結果串列（子集串列）
    backtrack(state, target, total, nums, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9
    val res = subsetSumINaive(nums, target)

    println("輸入陣列 nums = ${nums.contentToString()}, target = $target")
    println("所有和等於 $target 的子集 res = $res")
    println("請注意，該方法輸出的結果包含重複集合")
}
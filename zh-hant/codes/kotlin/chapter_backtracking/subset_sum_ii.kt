/**
 * File: subset_sum_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_ii

/* 回溯演算法：子集和 II */
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
    // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
    for (i in start..<choices.size) {
        // 剪枝一：若子集和超過 target ，則直接結束迴圈
        // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
        if (target - choices[i] < 0) {
            break
        }
        // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
        if (i > start && choices[i] == choices[i - 1]) {
            continue
        }
        // 嘗試：做出選擇，更新 target, start
        state.add(choices[i])
        // 進行下一輪選擇
        backtrack(state, target - choices[i], choices, i + 1, res)
        // 回退：撤銷選擇，恢復到之前的狀態
        state.removeAt(state.size - 1)
    }
}

/* 求解子集和 II */
fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 狀態（子集）
    nums.sort() // 對 nums 進行排序
    val start = 0 // 走訪起始點
    val res = mutableListOf<MutableList<Int>?>() // 結果串列（子集串列）
    backtrack(state, target, nums, start, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 4, 5)
    val target = 9
    val res = subsetSumII(nums, target)

    println("輸入陣列 nums = ${nums.contentToString()}, target = $target")
    println("所有和等於 $target 的子集 res = $res")
}
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
    // 子集總和達到目標時，記錄此解
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // 逐一檢查所有選項
    // 剪枝二：從 start 開始走訪，避免產生重複子集
    // 剪枝三：從 start 開始走訪，避免重複選取同一個元素
    for (i in start..<choices.size) {
        // 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
        // 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
        if (target - choices[i] < 0) {
            break
        }
        // 剪枝四：若本輪已嘗試過左鄰的相等元素，就略過這個重複分支
        if (i > start && choices[i] == choices[i - 1]) {
            continue
        }
        // 嘗試：做出選擇，更新 target 和 start
        state.add(choices[i])
        // 進入下一輪選擇
        backtrack(state, target - choices[i], choices, i + 1, res)
        // 回溯：撤銷選擇，還原先前的狀態
        state.removeAt(state.size - 1)
    }
}

/* 求解子集和 II */
fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 狀態（子集）
    nums.sort() // 將 nums 排序
    val start = 0 // 走訪的起點
    val res = mutableListOf<MutableList<Int>?>() // 結果串列（子集串列）
    backtrack(state, target, nums, start, res)
    return res
}

/* 主程式 */
fun main() {
    val nums = intArrayOf(4, 4, 5)
    val target = 9
    val res = subsetSumII(nums, target)

    println("輸入陣列 nums = ${nums.contentToString()}, target = $target")
    println("總和等於 $target 的所有子集 res = $res")
}
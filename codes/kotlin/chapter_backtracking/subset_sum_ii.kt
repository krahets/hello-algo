/**
 * File: subset_sum_ii.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_ii

/* 回溯算法：子集和 II */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    choices: IntArray,
    start: Int,
    res: MutableList<MutableList<Int>?>
) {
    // 子集和等于 target 时，记录解
    if (target == 0) {
        res.add(state.toMutableList())
        return
    }
    // 遍历所有选择
    // 剪枝二：从 start 开始遍历，避免生成重复子集
    // 剪枝三：从 start 开始遍历，避免重复选择同一元素
    for (i in start..<choices.size) {
        // 剪枝一：若子集和超过 target ，则直接结束循环
        // 这是因为数组已排序，后边元素更大，子集和一定超过 target
        if (target - choices[i] < 0) {
            break
        }
        // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
        if (i > start && choices[i] == choices[i - 1]) {
            continue
        }
        // 尝试：做出选择，更新 target, start
        state.add(choices[i])
        // 进行下一轮选择
        backtrack(state, target - choices[i], choices, i + 1, res)
        // 回退：撤销选择，恢复到之前的状态
        state.removeAt(state.size - 1)
    }
}

/* 求解子集和 II */
fun subsetSumII(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 状态（子集）
    nums.sort() // 对 nums 进行排序
    val start = 0 // 遍历起始点
    val res = mutableListOf<MutableList<Int>?>() // 结果列表（子集列表）
    backtrack(state, target, nums, start, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(4, 4, 5)
    val target = 9
    val res = subsetSumII(nums, target)

    println("输入数组 nums = ${nums.contentToString()}, target = $target")
    println("所有和等于 $target 的子集 res = $res")
}
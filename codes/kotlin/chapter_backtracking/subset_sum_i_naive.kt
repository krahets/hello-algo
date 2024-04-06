/**
 * File: subset_sum_i_native.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_backtracking.subset_sum_i_naive

/* 回溯算法：子集和 I */
fun backtrack(
    state: MutableList<Int>,
    target: Int,
    total: Int,
    choices: IntArray,
    res: MutableList<MutableList<Int>?>
) {
    // 子集和等于 target 时，记录解
    if (total == target) {
        res.add(state.toMutableList())
        return
    }
    // 遍历所有选择
    for (i in choices.indices) {
        // 剪枝：若子集和超过 target ，则跳过该选择
        if (total + choices[i] > target) {
            continue
        }
        // 尝试：做出选择，更新元素和 total
        state.add(choices[i])
        // 进行下一轮选择
        backtrack(state, target, total + choices[i], choices, res)
        // 回退：撤销选择，恢复到之前的状态
        state.removeAt(state.size - 1)
    }
}

/* 求解子集和 I（包含重复子集） */
fun subsetSumINaive(nums: IntArray, target: Int): MutableList<MutableList<Int>?> {
    val state = mutableListOf<Int>() // 状态（子集）
    val total = 0 // 子集和
    val res = mutableListOf<MutableList<Int>?>() // 结果列表（子集列表）
    backtrack(state, target, total, nums, res)
    return res
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(3, 4, 5)
    val target = 9
    val res = subsetSumINaive(nums, target)

    println("输入数组 nums = ${nums.contentToString()}, target = $target")
    println("所有和等于 $target 的子集 res = $res")
    println("请注意，该方法输出的结果包含重复集合")
}
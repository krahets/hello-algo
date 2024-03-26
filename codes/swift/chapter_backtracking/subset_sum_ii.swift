/**
 * File: subset_sum_ii.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯算法：子集和 II */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // 子集和等于 target 时，记录解
    if target == 0 {
        res.append(state)
        return
    }
    // 遍历所有选择
    // 剪枝二：从 start 开始遍历，避免生成重复子集
    // 剪枝三：从 start 开始遍历，避免重复选择同一元素
    for i in choices.indices.dropFirst(start) {
        // 剪枝一：若子集和超过 target ，则直接结束循环
        // 这是因为数组已排序，后边元素更大，子集和一定超过 target
        if target - choices[i] < 0 {
            break
        }
        // 剪枝四：如果该元素与左边元素相等，说明该搜索分支重复，直接跳过
        if i > start, choices[i] == choices[i - 1] {
            continue
        }
        // 尝试：做出选择，更新 target, start
        state.append(choices[i])
        // 进行下一轮选择
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
        // 回退：撤销选择，恢复到之前的状态
        state.removeLast()
    }
}

/* 求解子集和 II */
func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // 状态（子集）
    let nums = nums.sorted() // 对 nums 进行排序
    let start = 0 // 遍历起始点
    var res: [[Int]] = [] // 结果列表（子集列表）
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumII {
    /* Driver Code */
    static func main() {
        let nums = [4, 4, 5]
        let target = 9

        let res = subsetSumII(nums: nums, target: target)

        print("输入数组 nums = \(nums), target = \(target)")
        print("所有和等于 \(target) 的子集 res = \(res)")
    }
}

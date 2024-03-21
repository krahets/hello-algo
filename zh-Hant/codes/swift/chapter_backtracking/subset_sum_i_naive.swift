/**
 * File: subset_sum_i_naive.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯算法：子集和 I */
func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
    // 子集和等于 target 时，记录解
    if total == target {
        res.append(state)
        return
    }
    // 遍历所有选择
    for i in choices.indices {
        // 剪枝：若子集和超过 target ，则跳过该选择
        if total + choices[i] > target {
            continue
        }
        // 尝试：做出选择，更新元素和 total
        state.append(choices[i])
        // 进行下一轮选择
        backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
        // 回退：撤销选择，恢复到之前的状态
        state.removeLast()
    }
}

/* 求解子集和 I（包含重复子集） */
func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // 状态（子集）
    let total = 0 // 子集和
    var res: [[Int]] = [] // 结果列表（子集列表）
    backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
    return res
}

@main
enum SubsetSumINaive {
    /* Driver Code */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumINaive(nums: nums, target: target)

        print("输入数组 nums = \(nums), target = \(target)")
        print("所有和等于 \(target) 的子集 res = \(res)")
        print("请注意，该方法输出的结果包含重复集合")
    }
}

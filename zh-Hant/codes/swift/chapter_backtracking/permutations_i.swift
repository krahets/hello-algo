/**
 * File: permutations_i.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯算法：全排列 I */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // 当状态长度等于元素数量时，记录解
    if state.count == choices.count {
        res.append(state)
        return
    }
    // 遍历所有选择
    for (i, choice) in choices.enumerated() {
        // 剪枝：不允许重复选择元素
        if !selected[i] {
            // 尝试：做出选择，更新状态
            selected[i] = true
            state.append(choice)
            // 进行下一轮选择
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // 回退：撤销选择，恢复到之前的状态
            selected[i] = false
            state.removeLast()
        }
    }
}

/* 全排列 I */
func permutationsI(nums: [Int]) -> [[Int]] {
    var state: [Int] = []
    var selected = Array(repeating: false, count: nums.count)
    var res: [[Int]] = []
    backtrack(state: &state, choices: nums, selected: &selected, res: &res)
    return res
}

@main
enum PermutationsI {
    /* Driver Code */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsI(nums: nums)

        print("输入数组 nums = \(nums)")
        print("所有排列 res = \(res)")
    }
}

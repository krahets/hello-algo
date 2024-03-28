/**
 * File: permutations_i.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯演算法：全排列 I */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // 當狀態長度等於元素數量時，記錄解
    if state.count == choices.count {
        res.append(state)
        return
    }
    // 走訪所有選擇
    for (i, choice) in choices.enumerated() {
        // 剪枝：不允許重複選擇元素
        if !selected[i] {
            // 嘗試：做出選擇，更新狀態
            selected[i] = true
            state.append(choice)
            // 進行下一輪選擇
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // 回退：撤銷選擇，恢復到之前的狀態
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

        print("輸入陣列 nums = \(nums)")
        print("所有排列 res = \(res)")
    }
}

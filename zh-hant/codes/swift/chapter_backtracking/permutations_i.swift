/**
 * File: permutations_i.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯演算法：全排列 I */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // 當狀態長度等於元素個數時，記錄此解
    if state.count == choices.count {
        res.append(state)
        return
    }
    // 逐一檢查所有選項
    for (i, choice) in choices.enumerated() {
        // 剪枝：不可重複選取同一個元素
        if !selected[i] {
            // 嘗試：做出選擇並更新狀態
            selected[i] = true
            state.append(choice)
            // 進入下一輪選擇
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // 回溯：撤銷選擇，還原先前的狀態
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
    /* 主程式 */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsI(nums: nums)

        print("輸入陣列 nums = \(nums)")
        print("所有排列 res = \(res)")
    }
}

/**
 * File: subset_sum_i_naive.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯演算法：子集和 I */
func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
    // 子集和等於 target 時，記錄解
    if total == target {
        res.append(state)
        return
    }
    // 走訪所有選擇
    for i in choices.indices {
        // 剪枝：若子集和超過 target ，則跳過該選擇
        if total + choices[i] > target {
            continue
        }
        // 嘗試：做出選擇，更新元素和 total
        state.append(choices[i])
        // 進行下一輪選擇
        backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
        // 回退：撤銷選擇，恢復到之前的狀態
        state.removeLast()
    }
}

/* 求解子集和 I（包含重複子集） */
func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // 狀態（子集）
    let total = 0 // 子集和
    var res: [[Int]] = [] // 結果串列（子集串列）
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

        print("輸入陣列 nums = \(nums), target = \(target)")
        print("所有和等於 \(target) 的子集 res = \(res)")
        print("請注意，該方法輸出的結果包含重複集合")
    }
}

/**
 * File: subset_sum_ii.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯演算法：子集和 II */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // 子集總和達到目標時，記錄此解
    if target == 0 {
        res.append(state)
        return
    }
    // 逐一檢查所有選項
    // 剪枝二：從 start 開始走訪，避免產生重複子集
    // 剪枝三：從 start 開始走訪，避免重複選取同一個元素
    for i in choices.indices.dropFirst(start) {
        // 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
        // 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
        if target - choices[i] < 0 {
            break
        }
        // 剪枝四：若本輪已嘗試過左鄰的相等元素，就略過這個重複分支
        if i > start, choices[i] == choices[i - 1] {
            continue
        }
        // 嘗試：做出選擇，更新 target 和 start
        state.append(choices[i])
        // 進入下一輪選擇
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
        // 回溯：撤銷選擇，還原先前的狀態
        state.removeLast()
    }
}

/* 求解子集和 II */
func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // 狀態（子集）
    let nums = nums.sorted() // 將 nums 排序
    let start = 0 // 走訪的起點
    var res: [[Int]] = [] // 結果串列（子集串列）
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumII {
    /* 主程式 */
    static func main() {
        let nums = [4, 4, 5]
        let target = 9

        let res = subsetSumII(nums: nums, target: target)

        print("輸入陣列 nums = \(nums), target = \(target)")
        print("總和等於 \(target) 的所有子集 res = \(res)")
    }
}

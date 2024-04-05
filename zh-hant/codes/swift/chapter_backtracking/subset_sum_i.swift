/**
 * File: subset_sum_i.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 回溯演算法：子集和 I */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // 子集和等於 target 時，記錄解
    if target == 0 {
        res.append(state)
        return
    }
    // 走訪所有選擇
    // 剪枝二：從 start 開始走訪，避免生成重複子集
    for i in choices.indices.dropFirst(start) {
        // 剪枝一：若子集和超過 target ，則直接結束迴圈
        // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
        if target - choices[i] < 0 {
            break
        }
        // 嘗試：做出選擇，更新 target, start
        state.append(choices[i])
        // 進行下一輪選擇
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i, res: &res)
        // 回退：撤銷選擇，恢復到之前的狀態
        state.removeLast()
    }
}

/* 求解子集和 I */
func subsetSumI(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // 狀態（子集）
    let nums = nums.sorted() // 對 nums 進行排序
    let start = 0 // 走訪起始點
    var res: [[Int]] = [] // 結果串列（子集串列）
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumI {
    /* Driver Code */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumI(nums: nums, target: target)

        print("輸入陣列 nums = \(nums), target = \(target)")
        print("所有和等於 \(target) 的子集 res = \(res)")
    }
}

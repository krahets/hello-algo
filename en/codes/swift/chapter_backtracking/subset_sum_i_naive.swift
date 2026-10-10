/**
 * File: subset_sum_i_naive.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking algorithm: Subset sum I */
func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
    // When the subset sum equals target, record the solution
    if total == target {
        res.append(state)
        return
    }
    // Traverse all choices
    for i in choices.indices {
        // Pruning: if the subset sum exceeds target, skip this choice
        if total + choices[i] > target {
            continue
        }
        // Attempt: make choice, update element sum total
        state.append(choices[i])
        // Proceed to the next round of selection
        backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
        // Backtrack: undo choice, restore to previous state
        state.removeLast()
    }
}

/* Solve subset sum I (including duplicate subsets) */
func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // State (subset)
    let total = 0 // Subset sum
    var res: [[Int]] = [] // Result list (subset list)
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

        print("Input array nums = \(nums), target = \(target)")
        print("All subsets with sum equal to \(target) res = \(res)")
        print("Please note that this method outputs results containing duplicate sets")
    }
}

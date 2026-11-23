/**
 * File: subset_sum_i_naive.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking: subset sum I */
func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
    // Record a solution when the subset sum equals target
    if total == target {
        res.append(state)
        return
    }
    // Iterate over all choices
    for i in choices.indices {
        // Prune: skip this choice if the subset sum would exceed target
        if total + choices[i] > target {
            continue
        }
        // Try: make a choice and update the sum total
        state.append(choices[i])
        // Proceed to the next choice
        backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
        // Backtrack: undo the choice and restore the previous state
        state.removeLast()
    }
}

/* Solve subset sum I (with duplicate subsets) */
func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // State (subset)
    let total = 0 // Subset sum
    var res: [[Int]] = [] // Result list (list of subsets)
    backtrack(state: &state, target: target, total: total, choices: nums, res: &res)
    return res
}

@main
enum SubsetSumINaive {
    /* Driver code */
    static func main() {
        let nums = [3, 4, 5]
        let target = 9

        let res = subsetSumINaive(nums: nums, target: target)

        print("Input array nums = \(nums), target = \(target)")
        print("All subsets with sum \(target): res = \(res)")
        print("Note that this method produces duplicate subsets")
    }
}

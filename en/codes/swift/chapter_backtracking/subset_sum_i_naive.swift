/**
 * File: subset_sum_i_naive.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking: subset sum I */
func backtrack(state: inout [Int], target: Int, total: Int, choices: [Int], res: inout [[Int]]) {
    // Record a solution when the subset sums to target
    if total == target {
        res.append(state)
        return
    }
    // Try each choice
    for i in choices.indices {
        // Prune: skip choices that would take the subset sum over target
        if total + choices[i] > target {
            continue
        }
        // Make a choice and update the running sum total
        state.append(choices[i])
        // Make the next choice
        backtrack(state: &state, target: target, total: total + choices[i], choices: choices, res: &res)
        // Backtrack: undo the choice to restore the previous state
        state.removeLast()
    }
}

/* Solve subset sum I (including duplicate subsets) */
func subsetSumINaive(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // State (current subset)
    let total = 0 // Subset sum
    var res: [[Int]] = [] // Results (list of subsets)
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
        print("Subsets that sum to \(target): res = \(res)")
        print("This method returns duplicate subsets")
    }
}

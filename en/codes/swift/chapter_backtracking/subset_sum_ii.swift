/**
 * File: subset_sum_ii.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking: subset sum II */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // Record a solution when the remaining target reaches zero
    if target == 0 {
        res.append(state)
        return
    }
    // Iterate over all choices
    // Pruning 2: iterate from start to avoid generating duplicate subsets
    // Pruning 3: start after the previously chosen index to avoid choosing the same element again
    for i in choices.indices.dropFirst(start) {
        // Pruning 1: exit the loop if this choice exceeds the remaining target
        // The array is sorted, so later elements are at least as large and also exceed the remaining target
        if target - choices[i] < 0 {
            break
        }
        // Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
        if i > start, choices[i] == choices[i - 1] {
            continue
        }
        // Try: make a choice and update target and start
        state.append(choices[i])
        // Proceed to the next choice
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
        // Backtrack: undo the choice and restore the previous state
        state.removeLast()
    }
}

/* Solve subset sum II */
func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // State (subset)
    let nums = nums.sorted() // Sort nums
    let start = 0 // Starting index for iteration
    var res: [[Int]] = [] // Result list (list of subsets)
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumII {
    /* Driver code */
    static func main() {
        let nums = [4, 4, 5]
        let target = 9

        let res = subsetSumII(nums: nums, target: target)

        print("Input array nums = \(nums), target = \(target)")
        print("All subsets with sum \(target): res = \(res)")
    }
}

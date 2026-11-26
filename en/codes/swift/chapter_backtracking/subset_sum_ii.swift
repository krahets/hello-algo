/**
 * File: subset_sum_ii.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking: subset sum II */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // Record a solution when the subset sums to target
    if target == 0 {
        res.append(state)
        return
    }
    // Try each choice
    // Pruning rule 2: start at start to avoid duplicate subsets
    // Pruning rule 3: start at start to avoid reusing the same element
    for i in choices.indices.dropFirst(start) {
        // Pruning rule 1: break if the subset sum would exceed target
        // The array is sorted, so later elements are at least as large and would also take the sum over target
        if target - choices[i] < 0 {
            break
        }
        // Pruning rule 4: skip a value equal to its left neighbor, since its search branch is a duplicate
        if i > start, choices[i] == choices[i - 1] {
            continue
        }
        // Make a choice and update target and start
        state.append(choices[i])
        // Make the next choice
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
        // Backtrack: undo the choice to restore the previous state
        state.removeLast()
    }
}

/* Solve subset sum II */
func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // State (current subset)
    let nums = nums.sorted() // Sort nums
    let start = 0 // Starting index
    var res: [[Int]] = [] // Results (list of subsets)
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
        print("Subsets that sum to \(target): res = \(res)")
    }
}

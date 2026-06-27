/**
 * File: subset_sum_ii.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking algorithm: Subset sum II */
func backtrack(state: inout [Int], target: Int, choices: [Int], start: Int, res: inout [[Int]]) {
    // When the subset sum equals target, record the solution
    if target == 0 {
        res.append(state)
        return
    }
    // Traverse all choices
    // Pruning 2: start traversing from start to avoid generating duplicate subsets
    // Pruning 3: start traversing from start to avoid repeatedly selecting the same element
    for i in choices.indices.dropFirst(start) {
        // Pruning 1: if the subset sum exceeds target, end the loop directly
        // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if target - choices[i] < 0 {
            break
        }
        // Pruning 4: if this element equals the left element, it means this search branch is duplicate, skip it directly
        if i > start, choices[i] == choices[i - 1] {
            continue
        }
        // Attempt: make choice, update target, start
        state.append(choices[i])
        // Proceed to the next round of selection
        backtrack(state: &state, target: target - choices[i], choices: choices, start: i + 1, res: &res)
        // Backtrack: undo choice, restore to previous state
        state.removeLast()
    }
}

/* Solve subset sum II */
func subsetSumII(nums: [Int], target: Int) -> [[Int]] {
    var state: [Int] = [] // State (subset)
    let nums = nums.sorted() // Sort nums
    let start = 0 // Start point for traversal
    var res: [[Int]] = [] // Result list (subset list)
    backtrack(state: &state, target: target, choices: nums, start: start, res: &res)
    return res
}

@main
enum SubsetSumII {
    /* Driver Code */
    static func main() {
        let nums = [4, 4, 5]
        let target = 9

        let res = subsetSumII(nums: nums, target: target)

        print("Input array nums = \(nums), target = \(target)")
        print("All subsets with sum equal to \(target) res = \(res)")
    }
}

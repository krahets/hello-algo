/**
 * File: permutations_ii.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking: permutations II */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // Record a solution when the state contains all the elements
    if state.count == choices.count {
        res.append(state)
        return
    }
    // Try each choice
    var duplicated: Set<Int> = []
    for (i, choice) in choices.enumerated() {
        // Skip elements already in use and values already tried at this level
        if !selected[i], !duplicated.contains(choice) {
            // Make a choice and update the state
            duplicated.insert(choice) // Track values already tried
            selected[i] = true
            state.append(choice)
            // Make the next choice
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // Backtrack: undo the choice to restore the previous state
            selected[i] = false
            state.removeLast()
        }
    }
}

/* Permutations II */
func permutationsII(nums: [Int]) -> [[Int]] {
    var state: [Int] = []
    var selected = Array(repeating: false, count: nums.count)
    var res: [[Int]] = []
    backtrack(state: &state, choices: nums, selected: &selected, res: &res)
    return res
}

@main
enum PermutationsII {
    /* Driver code */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsII(nums: nums)

        print("Input array nums = \(nums)")
        print("All permutations res = \(res)")
    }
}

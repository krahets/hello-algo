/**
 * File: permutations_ii.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking: permutations II */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // Record a solution when the state length equals the number of elements
    if state.count == choices.count {
        res.append(state)
        return
    }
    // Iterate over all choices
    var duplicated: Set<Int> = []
    for (i, choice) in choices.enumerated() {
        // Prune: do not reuse an element or choose the same value again at this depth
        if !selected[i], !duplicated.contains(choice) {
            // Try: make a choice and update the state
            duplicated.insert(choice) // Record the chosen value
            selected[i] = true
            state.append(choice)
            // Proceed to the next choice
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // Backtrack: undo the choice and restore the previous state
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

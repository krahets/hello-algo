/**
 * File: permutations_ii.swift
 * Created Time: 2023-04-30
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking algorithm: Permutations II */
func backtrack(state: inout [Int], choices: [Int], selected: inout [Bool], res: inout [[Int]]) {
    // When the state length equals the number of elements, record the solution
    if state.count == choices.count {
        res.append(state)
        return
    }
    // Traverse all choices
    var duplicated: Set<Int> = []
    for (i, choice) in choices.enumerated() {
        // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
        if !selected[i], !duplicated.contains(choice) {
            // Attempt: make choice, update state
            duplicated.insert(choice) // Record the selected element value
            selected[i] = true
            state.append(choice)
            // Proceed to the next round of selection
            backtrack(state: &state, choices: choices, selected: &selected, res: &res)
            // Backtrack: undo choice, restore to previous state
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
    /* Driver Code */
    static func main() {
        let nums = [1, 2, 3]

        let res = permutationsII(nums: nums)

        print("Input array nums = \(nums)")
        print("All permutations res = \(res)")
    }
}

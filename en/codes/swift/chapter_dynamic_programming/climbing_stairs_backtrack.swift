/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // Count one more way when we reach stair n
    if state == n {
        res[0] += 1
    }
    // Iterate over all choices
    for choice in choices {
        // Prune moves that would overshoot stair n
        if state + choice > n {
            continue
        }
        // Try a choice and update the state
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // Undo the choice
    }
}

/* Climbing stairs with backtracking */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // Each move can climb 1 or 2 stairs
    let state = 0 // Start at stair 0
    var res: [Int] = []
    res.append(0) // Store the number of ways in res[0]
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* Driver code */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("Climbing \(n) stairs: \(res) ways")
    }
}

/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // When climbing to the n-th stair, add 1 to the solution count
    if state == n {
        res[0] += 1
    }
    // Traverse all choices
    for choice in choices {
        // Pruning: not allowed to go beyond the n-th stair
        if state + choice > n {
            continue
        }
        // Attempt: make choice, update state
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // Backtrack
    }
}

/* Climbing stairs: Backtracking */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // Can choose to climb up 1 or 2 stairs
    let state = 0 // Start climbing from the 0-th stair
    var res: [Int] = []
    res.append(0) // Use res[0] to record the solution count
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("Climbing \(n) stairs has \(res) solutions")
    }
}

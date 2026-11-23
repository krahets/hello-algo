/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // When step n is reached, increase the number of ways by 1
    if state == n {
        res[0] += 1
    }
    // Iterate over all choices
    for choice in choices {
        // Prune: do not go beyond step n
        if state + choice > n {
            continue
        }
        // Try: make a choice and update the state
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // Backtrack
    }
}

/* Climbing stairs: backtracking */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // Choose to climb 1 or 2 steps
    let state = 0 // Start climbing from step 0
    var res: [Int] = []
    res.append(0) // Use res[0] to record the number of ways
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* Driver code */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("Number of ways to climb \(n) steps: \(res)")
    }
}

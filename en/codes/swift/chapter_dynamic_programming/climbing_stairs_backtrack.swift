/**
 * File: climbing_stairs_backtrack.swift
 * Created Time: 2023-07-15
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Backtracking */
func backtrack(choices: [Int], state: Int, n: Int, res: inout [Int]) {
    // When climbing to the nth step, add 1 to the number of solutions
    if state == n {
        res[0] += 1
    }
    // Traverse all choices
    for choice in choices {
        // Pruning: do not allow climbing beyond the nth step
        if state + choice > n {
            continue
        }
        // Attempt: make a choice, update the state
        backtrack(choices: choices, state: state + choice, n: n, res: &res)
        // Retract
    }
}

/* Climbing stairs: Backtracking */
func climbingStairsBacktrack(n: Int) -> Int {
    let choices = [1, 2] // Can choose to climb up 1 step or 2 steps
    let state = 0 // Start climbing from the 0th step
    var res: [Int] = []
    res.append(0) // Use res[0] to record the number of solutions
    backtrack(choices: choices, state: state, n: n, res: &res)
    return res[0]
}

@main
enum ClimbingStairsBacktrack {
    /* Driver Code */
    static func main() {
        let n = 9

        let res = climbingStairsBacktrack(n: n)
        print("Climbing \(n) stairs, there are \(res) different solutions")
    }
}

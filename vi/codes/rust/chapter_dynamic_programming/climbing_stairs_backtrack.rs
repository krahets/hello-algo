/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // When climbing to the n-th stair, add 1 to the solution count
    if state == n {
        res[0] = res[0] + 1;
    }
    // Traverse all choices
    for &choice in choices {
        // Pruning: not allowed to go beyond the n-th stair
        if state + choice > n {
            continue;
        }
        // Attempt: make choice, update state
        backtrack(choices, state + choice, n, res);
        // Backtrack
    }
}

/* Climbing stairs: Backtracking */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // Can choose to climb up 1 or 2 stairs
    let state = 0; // Start climbing from the 0-th stair
    let mut res = Vec::new();
    res.push(0); // Use res[0] to record the solution count
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("Climbing {n} stairs has {res} solutions");
}

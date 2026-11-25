/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // Count one more way when we reach stair n
    if state == n {
        res[0] = res[0] + 1;
    }
    // Iterate over all choices
    for &choice in choices {
        // Prune moves that would overshoot stair n
        if state + choice > n {
            continue;
        }
        // Try a choice and update the state
        backtrack(choices, state + choice, n, res);
        // Undo the choice
    }
}

/* Climbing stairs with backtracking */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // Each move can climb 1 or 2 stairs
    let state = 0; // Start at stair 0
    let mut res = Vec::new();
    res.push(0); // Store the number of ways in res[0]
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* Driver code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("Climbing {n} stairs: {res} ways");
}

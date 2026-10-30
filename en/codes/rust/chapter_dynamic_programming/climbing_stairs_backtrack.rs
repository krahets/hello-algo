/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // When step n is reached, increase the number of ways by 1
    if state == n {
        res[0] = res[0] + 1;
    }
    // Iterate over all choices
    for &choice in choices {
        // Prune: do not go beyond step n
        if state + choice > n {
            continue;
        }
        // Try: make a choice and update the state
        backtrack(choices, state + choice, n, res);
        // Backtrack
    }
}

/* Climbing stairs: backtracking */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // Choose to climb 1 or 2 steps
    let state = 0; // Start climbing from step 0
    let mut res = Vec::new();
    res.push(0); // Use res[0] to record the number of ways
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* Driver code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("Number of ways to climb {n} stairs: {res}");
}

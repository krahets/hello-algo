/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // When climbing to the nth step, add 1 to the number of solutions
    if state == n {
        res[0] = res[0] + 1;
    }
    // Traverse all choices
    for &choice in choices {
        // Pruning: do not allow climbing beyond the nth step
        if state + choice > n {
            continue;
        }
        // Attempt: make a choice, update the state
        backtrack(choices, state + choice, n, res);
        // Retract
    }
}

/* Climbing stairs: Backtracking */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // Can choose to climb up 1 step or 2 steps
    let state = 0; // Start climbing from the 0th step
    let mut res = Vec::new();
    res.push(0); // Use res[0] to record the number of solutions
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("Climb {n} steps, there are {res} solutions in total");
}

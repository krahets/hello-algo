/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking algorithm: Subset sum I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // When the subset sum equals target, record the solution
    if total == target {
        res.push(state.clone());
        return;
    }
    // Traverse all choices
    for i in 0..choices.len() {
        // Pruning: if the subset sum exceeds target, skip this choice
        if total + choices[i] > target {
            continue;
        }
        // Attempt: make choice, update element sum total
        state.push(choices[i]);
        // Proceed to the next round of selection
        backtrack(state, target, total + choices[i], choices, res);
        // Backtrack: undo choice, restore to previous state
        state.pop();
    }
}

/* Solve subset sum I (including duplicate subsets) */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // State (subset)
    let total = 0; // Subset sum
    let mut res = Vec::new(); // Result list (subset list)
    backtrack(&mut state, target, total, nums, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("Input array nums = {:?}, target = {}", &nums, target);
    println!("All subsets with sum equal to {} res = {:?}", target, &res);
    println!("Please note that this method outputs results containing duplicate sets");
}

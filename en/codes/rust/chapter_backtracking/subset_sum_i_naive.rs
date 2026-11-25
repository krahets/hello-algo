/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking: subset sum I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // Record a solution when the subset sums to target
    if total == target {
        res.push(state.clone());
        return;
    }
    // Try each choice
    for i in 0..choices.len() {
        // Prune: skip choices that would take the subset sum over target
        if total + choices[i] > target {
            continue;
        }
        // Make a choice and update the running sum total
        state.push(choices[i]);
        // Make the next choice
        backtrack(state, target, total + choices[i], choices, res);
        // Backtrack: undo the choice to restore the previous state
        state.pop();
    }
}

/* Solve subset sum I (including duplicate subsets) */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // State (current subset)
    let total = 0; // Subset sum
    let mut res = Vec::new(); // Results (list of subsets)
    backtrack(&mut state, target, total, nums, &mut res);
    res
}

/* Driver code */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("Input array nums = {:?}, target = {}", &nums, target);
    println!("Subsets that sum to {}: res = {:?}", target, &res);
    println!("This method returns duplicate subsets");
}

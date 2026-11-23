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
    // Record a solution when the subset sum equals target
    if total == target {
        res.push(state.clone());
        return;
    }
    // Iterate over all choices
    for i in 0..choices.len() {
        // Prune: skip this choice if the subset sum would exceed target
        if total + choices[i] > target {
            continue;
        }
        // Try: make a choice and update the sum total
        state.push(choices[i]);
        // Proceed to the next choice
        backtrack(state, target, total + choices[i], choices, res);
        // Backtrack: undo the choice and restore the previous state
        state.pop();
    }
}

/* Solve subset sum I (with duplicate subsets) */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // State (subset)
    let total = 0; // Subset sum
    let mut res = Vec::new(); // Result list (list of subsets)
    backtrack(&mut state, target, total, nums, &mut res);
    res
}

/* Driver code */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("Input array nums = {:?}, target = {}", &nums, target);
    println!("All subsets with sum {}: res = {:?}", target, &res);
    println!("Note that this method produces duplicate subsets");
}

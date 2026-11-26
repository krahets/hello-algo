/*
 * File: subset_sum_i.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking: subset sum I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // Record a solution when the subset sums to target
    if target == 0 {
        res.push(state.clone());
        return;
    }
    // Try each choice
    // Pruning rule 2: start at start to avoid duplicate subsets
    for i in start..choices.len() {
        // Pruning rule 1: break if the subset sum would exceed target
        // The array is sorted, so later elements are at least as large and would also take the sum over target
        if target - choices[i] < 0 {
            break;
        }
        // Make a choice and update target and start
        state.push(choices[i]);
        // Make the next choice
        backtrack(state, target - choices[i], choices, i, res);
        // Backtrack: undo the choice to restore the previous state
        state.pop();
    }
}

/* Solve subset sum I */
fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // State (current subset)
    nums.sort(); // Sort nums
    let start = 0; // Starting index
    let mut res = Vec::new(); // Results (list of subsets)
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* Driver code */
pub fn main() {
    let mut nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i(&mut nums, target);

    println!("Input array nums = {:?}, target = {}", &nums, target);
    println!("Subsets that sum to {}: res = {:?}", target, &res);
}

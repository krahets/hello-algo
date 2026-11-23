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
    // Record a solution when the remaining target is zero
    if target == 0 {
        res.push(state.clone());
        return;
    }
    // Iterate over all choices
    // Pruning 2: iterate from start to avoid generating duplicate subsets
    for i in start..choices.len() {
        // Pruning 1: exit the loop if the next element exceeds the remaining target
        // The array is sorted, so later elements are at least as large and also exceed the remaining target
        if target - choices[i] < 0 {
            break;
        }
        // Try: make a choice and update target and start
        state.push(choices[i]);
        // Proceed to the next choice
        backtrack(state, target - choices[i], choices, i, res);
        // Backtrack: undo the choice and restore the previous state
        state.pop();
    }
}

/* Solve subset sum I */
fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // State (subset)
    nums.sort(); // Sort nums
    let start = 0; // Starting index for iteration
    let mut res = Vec::new(); // Result list (list of subsets)
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* Driver code */
pub fn main() {
    let mut nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i(&mut nums, target);

    println!("Input array nums = {:?}, target = {}", &nums, target);
    println!("All subsets with sum {}: res = {:?}", target, &res);
}

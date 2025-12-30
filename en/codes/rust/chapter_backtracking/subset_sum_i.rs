/*
 * File: subset_sum_i.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking algorithm: Subset sum I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // When the subset sum equals target, record the solution
    if target == 0 {
        res.push(state.clone());
        return;
    }
    // Traverse all choices
    // Pruning 2: start traversing from start to avoid generating duplicate subsets
    for i in start..choices.len() {
        // Pruning 1: if the subset sum exceeds target, end the loop directly
        // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if target - choices[i] < 0 {
            break;
        }
        // Attempt: make choice, update target, start
        state.push(choices[i]);
        // Proceed to the next round of selection
        backtrack(state, target - choices[i], choices, i, res);
        // Backtrack: undo choice, restore to previous state
        state.pop();
    }
}

/* Solve subset sum I */
fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // State (subset)
    nums.sort(); // Sort nums
    let start = 0; // Start point for traversal
    let mut res = Vec::new(); // Result list (subset list)
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i(&mut nums, target);

    println!("Input array nums = {:?}, target = {}", &nums, target);
    println!("All subsets with sum equal to {} res = {:?}", target, &res);
}

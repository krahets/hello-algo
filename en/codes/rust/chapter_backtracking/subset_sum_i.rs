/*
 * File: subset_sum_i.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking algorithm: Subset Sum I */
fn backtrack(
    mut state: Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // When the subset sum equals target, record the solution
    if target == 0 {
        res.push(state);
        return;
    }
    // Traverse all choices
    // Pruning two: start traversing from start to avoid generating duplicate subsets
    for i in start..choices.len() {
        // Pruning one: if the subset sum exceeds target, end the loop immediately
        // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if target - choices[i] < 0 {
            break;
        }
        // Attempt: make a choice, update target, start
        state.push(choices[i]);
        // Proceed to the next round of selection
        backtrack(state.clone(), target - choices[i], choices, i, res);
        // Retract: undo the choice, restore to the previous state
        state.pop();
    }
}

/* Solve Subset Sum I */
fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let state = Vec::new(); // State (subset)
    nums.sort(); // Sort nums
    let start = 0; // Start point for traversal
    let mut res = Vec::new(); // Result list (subset list)
    backtrack(state, target, nums, start, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i(&mut nums, target);

    println!("Input array nums = {:?}, target = {}", &nums, target);
    println!("All subsets equal to {} res = {:?}", target, &res);
}

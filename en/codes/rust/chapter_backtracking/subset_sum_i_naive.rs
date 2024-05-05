/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking algorithm: Subset Sum I */
fn backtrack(
    mut state: Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // When the subset sum equals target, record the solution
    if total == target {
        res.push(state);
        return;
    }
    // Traverse all choices
    for i in 0..choices.len() {
        // Pruning: if the subset sum exceeds target, skip that choice
        if total + choices[i] > target {
            continue;
        }
        // Attempt: make a choice, update elements and total
        state.push(choices[i]);
        // Proceed to the next round of selection
        backtrack(state.clone(), target, total + choices[i], choices, res);
        // Retract: undo the choice, restore to the previous state
        state.pop();
    }
}

/* Solve Subset Sum I (including duplicate subsets) */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let state = Vec::new(); // State (subset)
    let total = 0; // Subset sum
    let mut res = Vec::new(); // Result list (subset list)
    backtrack(state, target, total, nums, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("Input array nums = {:?}, target = {}", &nums, target);
    println!("All subsets equal to {} res = {:?}", target, &res);
    println!("Please note that the result of this method includes duplicate sets");
}

/*
 * File: permutations_ii.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashSet;

/* Backtracking algorithm: Permutations II */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // When the state length equals the number of elements, record the solution
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // Traverse all choices
    let mut duplicated = HashSet::<i32>::new();
    for i in 0..choices.len() {
        let choice = choices[i];
        // Pruning: do not allow repeated selection of elements and do not allow repeated selection of equal elements
        if !selected[i] && !duplicated.contains(&choice) {
            // Attempt: make choice, update state
            duplicated.insert(choice); // Record the selected element value
            selected[i] = true;
            state.push(choice);
            // Proceed to the next round of selection
            backtrack(state.clone(), choices, selected, res);
            // Backtrack: undo choice, restore to previous state
            selected[i] = false;
            state.pop();
        }
    }
}

/* Permutations II */
fn permutations_ii(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new();
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [1, 2, 2];

    let res = permutations_ii(&mut nums);

    println!("Input array nums = {:?}", &nums);
    println!("All permutations res = {:?}", &res);
}

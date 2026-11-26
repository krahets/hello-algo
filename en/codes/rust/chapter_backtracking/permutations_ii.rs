/*
 * File: permutations_ii.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashSet;

/* Backtracking: permutations II */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // Record a solution when the state contains all the elements
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // Try each choice
    let mut duplicated = HashSet::<i32>::new();
    for i in 0..choices.len() {
        let choice = choices[i];
        // Skip elements already in use and values already tried at this level
        if !selected[i] && !duplicated.contains(&choice) {
            // Make a choice and update the state
            duplicated.insert(choice); // Track values already tried
            selected[i] = true;
            state.push(choice);
            // Make the next choice
            backtrack(state.clone(), choices, selected, res);
            // Backtrack: undo the choice to restore the previous state
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

/* Driver code */
pub fn main() {
    let mut nums = [1, 2, 2];

    let res = permutations_ii(&mut nums);

    println!("Input array nums = {:?}", &nums);
    println!("All permutations res = {:?}", &res);
}

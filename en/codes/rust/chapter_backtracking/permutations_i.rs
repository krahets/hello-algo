/*
 * File: permutations_i.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking: permutations I */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // Record a solution when the state contains all the elements
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // Try each choice
    for i in 0..choices.len() {
        let choice = choices[i];
        // Prune: skip elements already in use
        if !selected[i] {
            // Make a choice and update the state
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

/* Permutations I */
fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new(); // State (current subset)
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* Driver code */
pub fn main() {
    let mut nums = [1, 2, 3];

    let res = permutations_i(&mut nums);

    println!("Input array nums = {:?}", &nums);
    println!("All permutations res = {:?}", &res);
}

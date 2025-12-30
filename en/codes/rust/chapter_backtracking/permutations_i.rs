/*
 * File: permutations_i.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* Backtracking algorithm: Permutations I */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // When the state length equals the number of elements, record the solution
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // Traverse all choices
    for i in 0..choices.len() {
        let choice = choices[i];
        // Pruning: do not allow repeated selection of elements
        if !selected[i] {
            // Attempt: make choice, update state
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

/* Permutations I */
fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new(); // State (subset)
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [1, 2, 3];

    let res = permutations_i(&mut nums);

    println!("Input array nums = {:?}", &nums);
    println!("All permutations res = {:?}", &res);
}

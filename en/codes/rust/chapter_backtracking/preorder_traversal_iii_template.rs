/*
 * File: preorder_traversal_iii_template.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use std::{cell::RefCell, rc::Rc};

/* Check if the current state is a solution */
fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
    return !state.is_empty() && state.last().unwrap().borrow().val == 7;
}

/* Record solution */
fn record_solution(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    res.push(state.clone());
}

/* Check if the choice is valid under the current state */
fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Option<&Rc<RefCell<TreeNode>>>) -> bool {
    return choice.is_some() && choice.unwrap().borrow().val != 3;
}

/* Update state */
fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
    state.push(choice);
}

/* Restore state */
fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
    state.pop();
}

/* Backtracking algorithm: Example 3 */
fn backtrack(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    choices: &Vec<Option<&Rc<RefCell<TreeNode>>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    // Check if it is a solution
    if is_solution(state) {
        // Record solution
        record_solution(state, res);
    }
    // Traverse all choices
    for &choice in choices.iter() {
        // Pruning: check if the choice is valid
        if is_valid(state, choice) {
            // Attempt: make choice, update state
            make_choice(state, choice.unwrap().clone());
            // Proceed to the next round of selection
            backtrack(
                state,
                &vec![
                    choice.unwrap().borrow().left.as_ref(),
                    choice.unwrap().borrow().right.as_ref(),
                ],
                res,
            );
            // Backtrack: undo choice, restore to previous state
            undo_choice(state, choice.unwrap().clone());
        }
    }
}

/* Driver Code */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("Initialize binary tree");
    print_util::print_tree(root.as_ref().unwrap());

    // Backtracking algorithm
    let mut res = Vec::new();
    backtrack(&mut Vec::new(), &mut vec![root.as_ref()], &mut res);

    println!("\nOutput all paths from root node to node 7, requiring paths do not include nodes with value 3");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}

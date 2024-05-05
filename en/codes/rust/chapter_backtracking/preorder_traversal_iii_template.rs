/*
 * File: preorder_traversal_iii_template.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use std::{cell::RefCell, rc::Rc};
use tree_node::{vec_to_tree, TreeNode};

/* Determine if the current state is a solution */
fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
    return !state.is_empty() && state.get(state.len() - 1).unwrap().borrow().val == 7;
}

/* Record solution */
fn record_solution(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    res.push(state.clone());
}

/* Determine if the choice is legal under the current state */
fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) -> bool {
    return choice.borrow().val != 3;
}

/* Update state */
fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
    state.push(choice);
}

/* Restore state */
fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
    state.remove(state.len() - 1);
}

/* Backtracking algorithm: Example three */
fn backtrack(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    choices: &mut Vec<Rc<RefCell<TreeNode>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    // Check if it's a solution
    if is_solution(state) {
        // Record solution
        record_solution(state, res);
    }
    // Traverse all choices
    for choice in choices {
        // Pruning: check if the choice is legal
        if is_valid(state, choice.clone()) {
            // Attempt: make a choice, update the state
            make_choice(state, choice.clone());
            // Proceed to the next round of selection
            backtrack(
                state,
                &mut vec![
                    choice.borrow().left.clone().unwrap(),
                    choice.borrow().right.clone().unwrap(),
                ],
                res,
            );
            // Retract: undo the choice, restore to the previous state
            undo_choice(state, choice.clone());
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
    backtrack(&mut Vec::new(), &mut vec![root.unwrap()], &mut res);

    println!("\nOutput all root-to-node 7 paths, requiring paths not to include nodes with value 3");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}

/*
 * File: preorder_traversal_iii_template.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use std::{cell::RefCell, rc::Rc};
use tree_node::{vec_to_tree, TreeNode};

/* 判断当前状态是否为解 */
fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
    return !state.is_empty() && state.last().unwrap().borrow().val == 7;
}

/* 记录解 */
fn record_solution(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    res.push(state.clone());
}

/* 判断在当前状态下，该选择是否合法 */
fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Option<&Rc<RefCell<TreeNode>>>) -> bool {
    return choice.is_some() && choice.unwrap().borrow().val != 3;
}

/* 更新状态 */
fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
    state.push(choice);
}

/* 恢复状态 */
fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
    state.pop();
}

/* 回溯算法：例题三 */
fn backtrack(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    choices: &Vec<Option<&Rc<RefCell<TreeNode>>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    // 检查是否为解
    if is_solution(state) {
        // 记录解
        record_solution(state, res);
    }
    // 遍历所有选择
    for &choice in choices.iter() {
        // 剪枝：检查选择是否合法
        if is_valid(state, choice) {
            // 尝试：做出选择，更新状态
            make_choice(state, choice.unwrap().clone());
            // 进行下一轮选择
            backtrack(
                state,
                &vec![
                    choice.unwrap().borrow().left.as_ref(),
                    choice.unwrap().borrow().right.as_ref(),
                ],
                res,
            );
            // 回退：撤销选择，恢复到之前的状态
            undo_choice(state, choice.unwrap().clone());
        }
    }
}

/* Driver Code */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("初始化二叉树");
    print_util::print_tree(root.as_ref().unwrap());

    // 回溯算法
    let mut res = Vec::new();
    backtrack(&mut Vec::new(), &mut vec![root.as_ref()], &mut res);

    println!("\n输出所有根节点到节点 7 的路径，要求路径中不包含值为 3 的节点");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}

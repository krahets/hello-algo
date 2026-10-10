/*
 * File: preorder_traversal_iii_template.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use std::{cell::RefCell, rc::Rc};

/* 現在の状態が解かどうかを判定 */
fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
    return !state.is_empty() && state.last().unwrap().borrow().val == 7;
}

/* 解を記録 */
fn record_solution(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    res.push(state.clone());
}

/* 現在の状態で、この選択が有効かどうかを判定 */
fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Option<&Rc<RefCell<TreeNode>>>) -> bool {
    return choice.is_some() && choice.unwrap().borrow().val != 3;
}

/* 状態を更新 */
fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
    state.push(choice);
}

/* 状態を元に戻す */
fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
    state.pop();
}

/* バックトラッキング：例題 3 */
fn backtrack(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    choices: &Vec<Option<&Rc<RefCell<TreeNode>>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    // 解かどうかを確認
    if is_solution(state) {
        // 解を記録
        record_solution(state, res);
    }
    // すべての選択肢を走査
    for &choice in choices.iter() {
        // 枝刈り：選択が妥当かを確認する
        if is_valid(state, choice) {
            // 試行: 選択を行い、状態を更新
            make_choice(state, choice.unwrap().clone());
            // 次の選択へ進む
            backtrack(
                state,
                &vec![
                    choice.unwrap().borrow().left.as_ref(),
                    choice.unwrap().borrow().right.as_ref(),
                ],
                res,
            );
            // バックトラック：選択を取り消し、前の状態に戻す
            undo_choice(state, choice.unwrap().clone());
        }
    }
}

/* Driver Code */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("二分木を初期化");
    print_util::print_tree(root.as_ref().unwrap());

    // バックトラッキング法
    let mut res = Vec::new();
    backtrack(&mut Vec::new(), &mut vec![root.as_ref()], &mut res);

    println!("\n根ノードからノード 7 までのすべての経路を出力し、経路に値が 3 のノードを含まないことを条件とする");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}

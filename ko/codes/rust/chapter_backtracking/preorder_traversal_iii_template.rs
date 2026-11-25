/*
 * File: preorder_traversal_iii_template.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use std::{cell::RefCell, rc::Rc};

/* 현재 상태가 해인지 확인한다 */
fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
    return !state.is_empty() && state.last().unwrap().borrow().val == 7;
}

/* 해를 기록한다 */
fn record_solution(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    res.push(state.clone());
}

/* 현재 상태에서 이 선택이 유효한지 확인한다 */
fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Option<&Rc<RefCell<TreeNode>>>) -> bool {
    return choice.is_some() && choice.unwrap().borrow().val != 3;
}

/* 상태를 갱신한다 */
fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
    state.push(choice);
}

/* 상태를 복원한다 */
fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
    state.pop();
}

/* 백트래킹: 예제 3 */
fn backtrack(
    state: &mut Vec<Rc<RefCell<TreeNode>>>,
    choices: &Vec<Option<&Rc<RefCell<TreeNode>>>>,
    res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
) {
    // 해인지 확인한다
    if is_solution(state) {
        // 해를 기록한다
        record_solution(state, res);
    }
    // 모든 선택지를 순회한다
    for &choice in choices.iter() {
        // 가지치기: 선택이 유효한지 확인한다
        if is_valid(state, choice) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            make_choice(state, choice.unwrap().clone());
            // 다음 선택을 진행한다
            backtrack(
                state,
                &vec![
                    choice.unwrap().borrow().left.as_ref(),
                    choice.unwrap().borrow().right.as_ref(),
                ],
                res,
            );
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undo_choice(state, choice.unwrap().clone());
        }
    }
}

/* 실행 코드 */
pub fn main() {
    let root = vec_to_tree([1, 7, 3, 4, 5, 6, 7].map(|x| Some(x)).to_vec());
    println!("이진 트리 초기화");
    print_util::print_tree(root.as_ref().unwrap());

    // 백트래킹 알고리즘
    let mut res = Vec::new();
    backtrack(&mut Vec::new(), &mut vec![root.as_ref()], &mut res);

    println!("\n루트에서 값이 7인 노드까지 값이 3인 노드를 거치지 않는 모든 경로 출력");
    for path in res {
        let mut vals = Vec::new();
        for node in path {
            vals.push(node.borrow().val)
        }
        println!("{:?}", vals);
    }
}

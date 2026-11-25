/*
 * File: binary_tree_bfs.rs
 * Created Time: 2023-04-07
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::collections::VecDeque;
use std::{cell::RefCell, rc::Rc};

/* 레벨 순회 */
fn level_order(root: &Rc<RefCell<TreeNode>>) -> Vec<i32> {
    // 큐를 초기화하고 루트 노드를 넣는다
    let mut que = VecDeque::new();
    que.push_back(root.clone());
    // 순회 결과를 저장할 리스트를 초기화한다
    let mut vec = Vec::new();

    while let Some(node) = que.pop_front() {
        // 큐에서 노드를 꺼낸다
        vec.push(node.borrow().val); // 노드 값을 저장한다
        if let Some(left) = node.borrow().left.as_ref() {
            que.push_back(left.clone()); // 왼쪽 자식을 큐에 넣는다
        }
        if let Some(right) = node.borrow().right.as_ref() {
            que.push_back(right.clone()); // 오른쪽 자식을 큐에 넣는다
        };
    }
    vec
}

/* 실행 코드 */
fn main() {
    /* 이진 트리 초기화 */
    // 배열에서 바로 이진 트리를 만드는 함수를 사용한다
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]).unwrap();
    println!("이진 트리 초기화\n");
    print_util::print_tree(&root);

    /* 레벨 순회 */
    let vec = level_order(&root);
    print!("\n레벨 순회로 출력한 노드 순서 = {:?}", vec);
}

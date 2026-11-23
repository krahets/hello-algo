/*
 * File: binary_tree_dfs.rs
 * Created Time: 2023-04-06
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use hello_algo_rust::include::{print_util, vec_to_tree, TreeNode};
use hello_algo_rust::op_vec;

use std::cell::RefCell;
use std::rc::Rc;

/* 전위 순회 */
fn pre_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
            let node = node.borrow();
            res.push(node.val);
            dfs(node.left.as_ref(), res);
            dfs(node.right.as_ref(), res);
        }
    }
    dfs(root, &mut result);

    result
}

/* 중위 순회 */
fn in_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
            let node = node.borrow();
            dfs(node.left.as_ref(), res);
            res.push(node.val);
            dfs(node.right.as_ref(), res);
        }
    }
    dfs(root, &mut result);

    result
}

/* 후위 순회 */
fn post_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    let mut result = vec![];

    fn dfs(root: Option<&Rc<RefCell<TreeNode>>>, res: &mut Vec<i32>) {
        if let Some(node) = root {
            // 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
            let node = node.borrow();
            dfs(node.left.as_ref(), res);
            dfs(node.right.as_ref(), res);
            res.push(node.val);
        }
    }

    dfs(root, &mut result);

    result
}

/* 실행 코드 */
fn main() {
    /* 이진 트리 초기화 */
    // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
    let root = vec_to_tree(op_vec![1, 2, 3, 4, 5, 6, 7]);
    println!("이진 트리 초기화\n");
    print_util::print_tree(root.as_ref().unwrap());

    /* 전위 순회 */
    let vec = pre_order(root.as_ref());
    println!("\n전위 순회에서 노드를 출력한 순서 = {:?}", vec);

    /* 중위 순회 */
    let vec = in_order(root.as_ref());
    println!("\n중위 순회에서 노드를 출력한 순서 = {:?}", vec);

    /* 후위 순회 */
    let vec = post_order(root.as_ref());
    print!("\n후위 순회에서 노드를 출력한 순서 = {:?}", vec);
}

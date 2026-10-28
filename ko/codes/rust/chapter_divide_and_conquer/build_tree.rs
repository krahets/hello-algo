/*
 * File: build_tree.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, TreeNode};
use std::collections::HashMap;
use std::{cell::RefCell, rc::Rc};

/* 이진 트리 구성: 분할 정복 */
fn dfs(
    preorder: &[i32],
    inorder_map: &HashMap<i32, i32>,
    i: i32,
    l: i32,
    r: i32,
) -> Option<Rc<RefCell<TreeNode>>> {
    // 서브트리 구간이 비어 있으면 종료한다
    if r - l < 0 {
        return None;
    }
    // 루트 노드를 초기화한다
    let root = TreeNode::new(preorder[i as usize]);
    // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
    let m = inorder_map.get(&preorder[i as usize]).unwrap();
    // 부분 문제: 왼쪽 서브트리 구성
    root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
    // 부분 문제: 오른쪽 서브트리 구성
    root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
    // 루트 노드를 반환한다
    Some(root)
}

/* 이진 트리 구성 */
fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
    // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
    let mut inorder_map: HashMap<i32, i32> = HashMap::new();
    for i in 0..inorder.len() {
        inorder_map.insert(inorder[i], i as i32);
    }
    let root = dfs(preorder, &inorder_map, 0, 0, inorder.len() as i32 - 1);
    root
}

/* 실행 코드 */
fn main() {
    let preorder = [3, 9, 2, 1, 7];
    let inorder = [9, 3, 1, 2, 7];
    println!("중위 순회 = {:?}", preorder);
    println!("전위 순회 = {:?}", inorder);

    let root = build_tree(&preorder, &inorder);
    println!("구성한 이진 트리:");
    print_util::print_tree(root.as_ref().unwrap());
}

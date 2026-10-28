/*
 * File: avl_tree.rs
 * Created Time: 2023-07-14
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::{print_util, TreeNode};

use std::cell::RefCell;
use std::cmp::Ordering;
use std::rc::Rc;

type OptionTreeNodeRc = Option<Rc<RefCell<TreeNode>>>;

/* AVL 트리 */
struct AVLTree {
    root: OptionTreeNodeRc, // 루트 노드
}

impl AVLTree {
    /* 생성자 */
    fn new() -> Self {
        Self { root: None }
    }

    /* 노드 높이 반환 */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // 빈 노드의 높이는 -1이고, 리프 노드의 높이는 0이다
        match node {
            Some(node) => node.borrow().height,
            None => -1,
        }
    }

    /* 노드 높이를 갱신한다 */
    fn update_height(node: OptionTreeNodeRc) {
        if let Some(node) = node {
            let left = node.borrow().left.clone();
            let right = node.borrow().right.clone();
            // 노드 높이는 가장 높은 서브트리의 높이 + 1이다
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }

    /* 균형 인수 반환 */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // 빈 노드의 균형 인수는 0이다
            None => 0,
            // 노드의 균형 인수 = 왼쪽 서브트리 높이 - 오른쪽 서브트리 높이
            Some(node) => {
                Self::height(node.borrow().left.clone()) - Self::height(node.borrow().right.clone())
            }
        }
    }

    /* 오른쪽 회전 연산 */
    fn right_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().left.clone().unwrap();
                let grand_child = child.borrow().right.clone();
                // child를 중심으로 node를 오른쪽으로 회전한다
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // 노드 높이를 갱신한다
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 회전한 서브트리의 루트 노드를 반환한다
                Some(child)
            }
            None => None,
        }
    }

    /* 왼쪽 회전 연산 */
    fn left_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().right.clone().unwrap();
                let grand_child = child.borrow().left.clone();
                // child를 중심으로 node를 왼쪽으로 회전한다
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // 노드 높이를 갱신한다
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // 회전한 서브트리의 루트 노드를 반환한다
                Some(child)
            }
            None => None,
        }
    }

    /* 회전 연산을 수행하여 해당 서브트리의 균형 복원 */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // 노드 node의 균형 인수를 구한다
        let balance_factor = Self::balance_factor(node.clone());
        // 왼쪽으로 치우친 트리
        if balance_factor > 1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // 오른쪽 회전
                Self::right_rotate(Some(node))
            } else {
                // 왼쪽으로 회전한 후 오른쪽으로 회전한다
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::left_rotate(left);
                Self::right_rotate(Some(node))
            }
        }
        // 오른쪽으로 치우친 트리
        else if balance_factor < -1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // 왼쪽 회전
                Self::left_rotate(Some(node))
            } else {
                // 오른쪽으로 회전한 후 왼쪽으로 회전한다
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::right_rotate(right);
                Self::left_rotate(Some(node))
            }
        } else {
            // 균형 트리이므로 회전할 필요 없이 바로 반환한다
            node
        }
    }

    /* 노드 삽입 */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* 노드의 재귀적 삽입(보조 메서드) */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. 삽입 위치를 찾아 노드를 삽입한다 */
                match {
                    let node_val = node.borrow().val;
                    node_val
                }
                .cmp(&val)
                {
                    Ordering::Greater => {
                        let left = node.borrow().left.clone();
                        node.borrow_mut().left = Self::insert_helper(left, val);
                    }
                    Ordering::Less => {
                        let right = node.borrow().right.clone();
                        node.borrow_mut().right = Self::insert_helper(right, val);
                    }
                    Ordering::Equal => {
                        return Some(node); // 중복 노드는 삽입하지 않고 바로 반환한다
                    }
                }
                Self::update_height(Some(node.clone())); // 노드 높이를 갱신한다

                /* 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다 */
                node = Self::rotate(Some(node)).unwrap();
                // 서브트리의 루트 노드를 반환한다
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }

    /* 노드 삭제 */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* 노드의 재귀적 삭제(보조 메서드) */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. 노드를 찾아 삭제한다 */
                if val < node.borrow().val {
                    let left = node.borrow().left.clone();
                    node.borrow_mut().left = Self::remove_helper(left, val);
                } else if val > node.borrow().val {
                    let right = node.borrow().right.clone();
                    node.borrow_mut().right = Self::remove_helper(right, val);
                } else if node.borrow().left.is_none() || node.borrow().right.is_none() {
                    let child = if node.borrow().left.is_some() {
                        node.borrow().left.clone()
                    } else {
                        node.borrow().right.clone()
                    };
                    match child {
                        // 자식 노드 수 = 0이면 node를 바로 삭제하고 반환한다
                        None => {
                            return None;
                        }
                        // 자식 노드 수 = 1이면 node를 바로 삭제한다
                        Some(child) => node = child,
                    }
                } else {
                    // 자식 노드 수 = 2이면 중위 순회의 다음 노드를 삭제하고, 그 노드로 현재 노드를 대체한다
                    let mut temp = node.borrow().right.clone().unwrap();
                    loop {
                        let temp_left = temp.borrow().left.clone();
                        if temp_left.is_none() {
                            break;
                        }
                        temp = temp_left.unwrap();
                    }
                    let right = node.borrow().right.clone();
                    node.borrow_mut().right = Self::remove_helper(right, temp.borrow().val);
                    node.borrow_mut().val = temp.borrow().val;
                }
                Self::update_height(Some(node.clone())); // 노드 높이를 갱신한다

                /* 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다 */
                node = Self::rotate(Some(node)).unwrap();
                // 서브트리의 루트 노드를 반환한다
                Some(node)
            }
            None => None,
        }
    }

    /* 노드 탐색 */
    fn search(&self, val: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // 반복하여 탐색하다 리프 노드를 지나면 종료한다
        while let Some(current) = cur.clone() {
            match current.borrow().val.cmp(&val) {
                // 목표 노드는 cur의 오른쪽 서브트리에 있다
                Ordering::Less => {
                    cur = current.borrow().right.clone();
                }
                // 목표 노드는 cur의 왼쪽 서브트리에 있다
                Ordering::Greater => {
                    cur = current.borrow().left.clone();
                }
                // 목표 노드를 찾았으므로 반복문을 종료한다
                Ordering::Equal => {
                    break;
                }
            }
        }
        // 목표 노드를 반환한다
        cur
    }
}

/* 실행 코드 */
fn main() {
    fn test_insert(tree: &mut AVLTree, val: i32) {
        tree.insert(val);
        println!("\n노드 {} 삽입 후의 AVL 트리", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    fn test_remove(tree: &mut AVLTree, val: i32) {
        tree.remove(val);
        println!("\n노드 {} 삭제 후의 AVL 트리", val);
        print_util::print_tree(&tree.root.clone().unwrap());
    }

    /* 빈 AVL 트리 초기화 */
    let mut avl_tree = AVLTree::new();

    /* 노드 삽입 */
    // 노드를 삽입한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
    test_insert(&mut avl_tree, 1);
    test_insert(&mut avl_tree, 2);
    test_insert(&mut avl_tree, 3);
    test_insert(&mut avl_tree, 4);
    test_insert(&mut avl_tree, 5);
    test_insert(&mut avl_tree, 8);
    test_insert(&mut avl_tree, 7);
    test_insert(&mut avl_tree, 9);
    test_insert(&mut avl_tree, 10);
    test_insert(&mut avl_tree, 6);

    /* 중복 노드 삽입 */
    test_insert(&mut avl_tree, 7);

    /* 노드 삭제 */
    // 노드를 삭제한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
    test_remove(&mut avl_tree, 8); // 차수가 0인 노드 삭제
    test_remove(&mut avl_tree, 5); // 차수가 1인 노드 삭제
    test_remove(&mut avl_tree, 4); // 차수가 2인 노드 삭제

    /* 노드 조회 */
    let node = avl_tree.search(7);
    if let Some(node) = node {
        println!(
            "\n찾은 노드 객체: {:?}, 노드 값 = {}",
            &*node.borrow(),
            node.borrow().val
        );
    }
}

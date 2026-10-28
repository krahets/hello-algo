/*
 * File: binary_search_tree.rs
 * Created Time: 2023-04-20
 * Author: xBLACKICEx (xBLACKICE@outlook.com)、night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cell::RefCell;
use std::cmp::Ordering;
use std::rc::Rc;

use hello_algo_rust::include::TreeNode;

type OptionTreeNodeRc = Option<Rc<RefCell<TreeNode>>>;

/* 이진 탐색 트리 */
pub struct BinarySearchTree {
    root: OptionTreeNodeRc,
}

impl BinarySearchTree {
    /* 생성자 */
    pub fn new() -> Self {
        // 빈 트리를 초기화한다
        Self { root: None }
    }

    /* 이진 트리의 루트 노드 반환 */
    pub fn get_root(&self) -> OptionTreeNodeRc {
        self.root.clone()
    }

    /* 노드 탐색 */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // 반복하여 탐색하다 리프 노드를 지나면 종료한다
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 목표 노드는 cur의 오른쪽 서브트리에 있다
                Ordering::Greater => cur = node.borrow().right.clone(),
                // 목표 노드는 cur의 왼쪽 서브트리에 있다
                Ordering::Less => cur = node.borrow().left.clone(),
                // 목표 노드를 찾았으므로 반복문을 종료한다
                Ordering::Equal => break,
            }
        }

        // 목표 노드를 반환한다
        cur
    }

    /* 노드 삽입 */
    pub fn insert(&mut self, num: i32) {
        // 트리가 비어 있으면 루트 노드를 초기화한다
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 반복하여 탐색하다 리프 노드를 지나면 종료한다
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 중복 노드를 찾으면 바로 반환한다
                Ordering::Equal => return,
                // 삽입 위치는 cur의 오른쪽 서브트리에 있다
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 삽입 위치는 cur의 왼쪽 서브트리에 있다
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 노드 삽입
        let pre = pre.unwrap();
        let node = Some(TreeNode::new(num));
        if num > pre.borrow().val {
            pre.borrow_mut().right = node;
        } else {
            pre.borrow_mut().left = node;
        }
    }

    /* 노드 삭제 */
    pub fn remove(&mut self, num: i32) {
        // 트리가 비어 있으면 바로 반환하여 종료한다
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 반복하여 탐색하다 리프 노드를 지나면 종료한다
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 삭제할 노드를 찾았으므로 반복문을 종료한다
                Ordering::Equal => break,
                // 삭제할 노드는 cur의 오른쪽 서브트리에 있다
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 삭제할 노드는 cur의 왼쪽 서브트리에 있다
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 삭제할 노드가 없으면 바로 반환한다
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // 자식 노드 수 = 0 또는 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // 자식 노드 수가 0 / 1이면 child = nullptr / 해당 자식 노드다
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // 노드 cur를 삭제한다
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // 삭제할 노드가 루트 노드이면 루트 노드를 다시 지정한다
                    self.root = child;
                }
            }
            // 자식 노드 수 = 2
            (Some(_), Some(_)) => {
                // 중위 순회에서 cur의 다음 노드를 구한다
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // 노드 tmp를 재귀적으로 삭제한다
                self.remove(tmp_val);
                // tmp로 cur를 덮어쓴다
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
}

/* 실행 코드 */
fn main() {
    /* 이진 탐색 트리 초기화 */
    let mut bst = BinarySearchTree::new();
    // 삽입 순서에 따라 서로 다른 이진 트리가 생성된다. 이 순서는 포화 이진 트리를 생성할 수 있다
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
    for &num in &nums {
        bst.insert(num);
    }
    println!("\n초기화한 이진 트리\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* 노드를 찾는다 */
    let node = bst.search(7);
    println!(
        "\n찾은 노드 객체: {:?}, 노드 값 = {}",
        node.clone().unwrap(),
        node.clone().unwrap().borrow().val
    );

    /* 노드 삽입 */
    bst.insert(16);
    println!("\n노드 16을 삽입한 후의 이진 트리\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* 노드 삭제 */
    bst.remove(1);
    println!("\n노드 1을 삭제한 후의 이진 트리\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(2);
    println!("\n노드 2를 삭제한 후의 이진 트리\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(4);
    println!("\n노드 4를 삭제한 후의 이진 트리\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
}

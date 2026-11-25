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
        // 빈 트리 초기화
        Self { root: None }
    }

    /* 이진 트리의 루트 노드 구하기 */
    pub fn get_root(&self) -> OptionTreeNodeRc {
        self.root.clone()
    }

    /* 노드 탐색 */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // 반복해서 찾다가 리프 노드를 지나면 종료한다
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 찾는 노드는 cur의 오른쪽 서브트리에 있다
                Ordering::Greater => cur = node.borrow().right.clone(),
                // 찾는 노드는 cur의 왼쪽 서브트리에 있다
                Ordering::Less => cur = node.borrow().left.clone(),
                // 찾는 노드를 발견했으므로 반복문을 종료한다
                Ordering::Equal => break,
            }
        }

        // 찾은 노드를 반환한다
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
        // 반복해서 찾다가 리프 노드를 지나면 종료한다
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 같은 값의 노드를 찾으면 바로 반환한다
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
        // 트리가 비어 있으면 바로 반환한다
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 반복해서 찾다가 리프 노드를 지나면 종료한다
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
            // 자식 수 = 0 또는 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // 자식 수가 0이면 child는 nullptr, 1이면 child는 그 자식 노드다
                let child = left_child.or(right_child);
                // 노드 cur 삭제
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let pre = pre.unwrap();
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // 삭제할 노드가 루트라면 루트 노드를 다시 지정한다
                    self.root = child;
                }
            }
            // 자식 수 = 2
            (Some(_), Some(_)) => {
                // 중위 순회에서 cur 다음에 오는 노드를 구한다
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
                // cur의 값을 tmp의 값으로 덮어쓴다
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
}

/* 실행 코드 */
fn main() {
    /* 이진 탐색 트리 초기화 */
    let mut bst = BinarySearchTree::new();
    // 삽입 순서가 다르면 이진 트리의 모양도 달라진다. 이 순서로 삽입하면 포화 이진 트리가 만들어진다
    let nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
    for &num in &nums {
        bst.insert(num);
    }
    println!("\n초기화한 이진 트리:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* 노드 탐색 */
    let node = bst.search(7);
    println!(
        "\n찾은 노드 객체: {:?}, 노드 값 = {}",
        node.clone().unwrap(),
        node.clone().unwrap().borrow().val
    );

    /* 노드 삽입 */
    bst.insert(16);
    println!("\n노드 16 삽입 후 이진 트리:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());

    /* 노드 삭제 */
    bst.remove(1);
    println!("\n노드 1 삭제 후 이진 트리:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(2);
    println!("\n노드 2 삭제 후 이진 트리:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
    bst.remove(4);
    println!("\n노드 4 삭제 후 이진 트리:\n");
    print_util::print_tree(bst.get_root().as_ref().unwrap());
}

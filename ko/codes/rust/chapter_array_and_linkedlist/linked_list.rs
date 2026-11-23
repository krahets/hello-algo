/*
 * File: linked_list.rs
 * Created Time: 2023-03-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};
use std::cell::RefCell;
use std::rc::Rc;

/* 연결 리스트의 노드 n0 뒤에 노드 P 삽입 */
#[allow(non_snake_case)]
pub fn insert<T>(n0: &Rc<RefCell<ListNode<T>>>, P: Rc<RefCell<ListNode<T>>>) {
    let n1 = n0.borrow_mut().next.take();
    P.borrow_mut().next = n1;
    n0.borrow_mut().next = Some(P);
}

/* 연결 리스트의 노드 n0 바로 뒤에 있는 노드 삭제 */
#[allow(non_snake_case)]
pub fn remove<T>(n0: &Rc<RefCell<ListNode<T>>>) {
    // n0 -> P -> n1
    let P = n0.borrow_mut().next.take();
    if let Some(node) = P {
        let n1 = node.borrow_mut().next.take();
        n0.borrow_mut().next = n1;
    }
}

/* 연결 리스트에서 인덱스가 index인 노드에 접근 */
pub fn access<T>(head: Rc<RefCell<ListNode<T>>>, index: i32) -> Option<Rc<RefCell<ListNode<T>>>> {
    fn dfs<T>(
        head: Option<&Rc<RefCell<ListNode<T>>>>,
        index: i32,
    ) -> Option<Rc<RefCell<ListNode<T>>>> {
        if index <= 0 {
            return head.cloned();
        }

        if let Some(node) = head {
            dfs(node.borrow().next.as_ref(), index - 1)
        } else {
            None
        }
    }

    dfs(Some(head).as_ref(), index)
}

/* 연결 리스트에서 값이 target인 첫 번째 노드 탐색 */
pub fn find<T: PartialEq>(head: Rc<RefCell<ListNode<T>>>, target: T) -> i32 {
    fn find<T: PartialEq>(head: Option<&Rc<RefCell<ListNode<T>>>>, target: T, idx: i32) -> i32 {
        if let Some(node) = head {
            if node.borrow().val == target {
                return idx;
            }
            return find(node.borrow().next.as_ref(), target, idx + 1);
        } else {
            -1
        }
    }

    find(Some(head).as_ref(), target, 0)
}

/* 실행 코드 */
fn main() {
    /* 연결 리스트 초기화 */
    // 각 노드를 초기화한다
    let n0 = ListNode::new(1);
    let n1 = ListNode::new(3);
    let n2 = ListNode::new(2);
    let n3 = ListNode::new(5);
    let n4 = ListNode::new(4);
    // 노드 사이의 참조를 설정한다
    n0.borrow_mut().next = Some(n1.clone());
    n1.borrow_mut().next = Some(n2.clone());
    n2.borrow_mut().next = Some(n3.clone());
    n3.borrow_mut().next = Some(n4.clone());
    print!("초기화한 연결 리스트 ");
    print_util::print_linked_list(&n0);

    /* 노드 삽입 */
    insert(&n0, ListNode::new(0));
    print!("노드를 삽입한 후의 연결 리스트 ");
    print_util::print_linked_list(&n0);

    /* 노드 삭제 */
    remove(&n0);
    print!("노드를 삭제한 후의 연결 리스트 ");
    print_util::print_linked_list(&n0);

    /* 노드 접근 */
    let node = access(n0.clone(), 3);
    println!("연결 리스트에서 인덱스 3에 있는 노드의 값 = {}", node.unwrap().borrow().val);

    /* 노드 탐색 */
    let index = find(n0.clone(), 2);
    println!("연결 리스트에서 값이 2인 노드의 인덱스 = {}", index);
}

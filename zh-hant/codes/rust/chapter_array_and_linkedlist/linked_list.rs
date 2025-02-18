/*
 * File: linked_list.rs
 * Created Time: 2023-03-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};
use std::cell::RefCell;
use std::rc::Rc;

/* 在鏈結串列的節點 n0 之後插入節點 P */
#[allow(non_snake_case)]
pub fn insert<T>(n0: &Rc<RefCell<ListNode<T>>>, P: Rc<RefCell<ListNode<T>>>) {
    let n1 = n0.borrow_mut().next.take();
    P.borrow_mut().next = n1;
    n0.borrow_mut().next = Some(P);
}

/* 刪除鏈結串列的節點 n0 之後的首個節點 */
#[allow(non_snake_case)]
pub fn remove<T>(n0: &Rc<RefCell<ListNode<T>>>) {
    // n0 -> P -> n1
    let P = n0.borrow_mut().next.take();
    if let Some(node) = P {
        let n1 = node.borrow_mut().next.take();
        n0.borrow_mut().next = n1;
    }
}

/* 訪問鏈結串列中索引為 index 的節點 */
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

/* 在鏈結串列中查詢值為 target 的首個節點 */
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

/* Driver Code */
fn main() {
    /* 初始化鏈結串列 */
    // 初始化各個節點
    let n0 = ListNode::new(1);
    let n1 = ListNode::new(3);
    let n2 = ListNode::new(2);
    let n3 = ListNode::new(5);
    let n4 = ListNode::new(4);
    // 構建節點之間的引用
    n0.borrow_mut().next = Some(n1.clone());
    n1.borrow_mut().next = Some(n2.clone());
    n2.borrow_mut().next = Some(n3.clone());
    n3.borrow_mut().next = Some(n4.clone());
    print!("初始化的鏈結串列為 ");
    print_util::print_linked_list(&n0);

    /* 插入節點 */
    insert(&n0, ListNode::new(0));
    print!("插入節點後的鏈結串列為 ");
    print_util::print_linked_list(&n0);

    /* 刪除節點 */
    remove(&n0);
    print!("刪除節點後的鏈結串列為 ");
    print_util::print_linked_list(&n0);

    /* 訪問節點 */
    let node = access(n0.clone(), 3);
    println!("鏈結串列中索引 3 處的節點的值 = {}", node.unwrap().borrow().val);

    /* 查詢節點 */
    let index = find(n0.clone(), 2);
    println!("鏈結串列中值為 2 的節點的索引 = {}", index);
}

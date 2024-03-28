/*
 * File: linked_list.rs
 * Created Time: 2023-03-05
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use list_node::ListNode;
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
    if n0.borrow().next.is_none() {
        return;
    };
    // n0 -> P -> n1
    let P = n0.borrow_mut().next.take();
    if let Some(node) = P {
        let n1 = node.borrow_mut().next.take();
        n0.borrow_mut().next = n1;
    }
}

/* 訪問鏈結串列中索引為 index 的節點 */
pub fn access<T>(head: Rc<RefCell<ListNode<T>>>, index: i32) -> Rc<RefCell<ListNode<T>>> {
    if index <= 0 {
        return head;
    };
    if let Some(node) = &head.borrow().next {
        return access(node.clone(), index - 1);
    }

    return head;
}

/* 在鏈結串列中查詢值為 target 的首個節點 */
pub fn find<T: PartialEq>(head: Rc<RefCell<ListNode<T>>>, target: T, index: i32) -> i32 {
    if head.borrow().val == target {
        return index;
    };
    if let Some(node) = &head.borrow_mut().next {
        return find(node.clone(), target, index + 1);
    }
    return -1;
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
    println!("鏈結串列中索引 3 處的節點的值 = {}", node.borrow().val);

    /* 查詢節點 */
    let index = find(n0.clone(), 2, 0);
    println!("鏈結串列中值為 2 的節點的索引 = {}", index);
}

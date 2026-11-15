/*
 * File: linked_list.rs
 * Created Time: 2023-03-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};
use std::cell::RefCell;
use std::rc::Rc;

/* 在链表的节点 n0 之后插入节点 P */
#[allow(non_snake_case)]
pub fn insert<T>(n0: &Rc<RefCell<ListNode<T>>>, P: Rc<RefCell<ListNode<T>>>) {
    let n1 = n0.borrow_mut().next.take();
    P.borrow_mut().next = n1;
    n0.borrow_mut().next = Some(P);
}

/* 删除链表的节点 n0 之后的首个节点 */
#[allow(non_snake_case)]
pub fn remove<T>(n0: &Rc<RefCell<ListNode<T>>>) {
    // n0 -> P -> n1
    let P = n0.borrow_mut().next.take();
    if let Some(node) = P {
        let n1 = node.borrow_mut().next.take();
        n0.borrow_mut().next = n1;
    }
}

/* 访问链表中索引为 index 的节点 */
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

/* 在链表中查找值为 target 的首个节点 */
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
    /* 初始化链表 */
    // 初始化各个节点
    let n0 = ListNode::new(1);
    let n1 = ListNode::new(3);
    let n2 = ListNode::new(2);
    let n3 = ListNode::new(5);
    let n4 = ListNode::new(4);
    // 构建节点之间的引用
    n0.borrow_mut().next = Some(n1.clone());
    n1.borrow_mut().next = Some(n2.clone());
    n2.borrow_mut().next = Some(n3.clone());
    n3.borrow_mut().next = Some(n4.clone());
    print!("初始化的链表为 ");
    print_util::print_linked_list(&n0);

    /* 插入节点 */
    insert(&n0, ListNode::new(0));
    print!("插入节点后的链表为 ");
    print_util::print_linked_list(&n0);

    /* 删除节点 */
    remove(&n0);
    print!("删除节点后的链表为 ");
    print_util::print_linked_list(&n0);

    /* 访问节点 */
    let node = access(n0.clone(), 3);
    println!("链表中索引 3 处的节点的值 = {}", node.unwrap().borrow().val);

    /* 查找节点 */
    let index = find(n0.clone(), 2);
    println!("链表中值为 2 的节点的索引 = {}", index);
}

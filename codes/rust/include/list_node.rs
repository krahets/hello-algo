/*
 * File: list_node.rs
 * Created Time: 2023-03-05
 * Author: sjinzh (sjinzh@gmail.com)
 */

use std::rc::Rc;
use std::cell::RefCell;

pub struct ListNode<T> {
    pub val: T,
    pub next: Option<Rc<RefCell<ListNode<T>>>>,
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
        Rc::new(RefCell::new(ListNode {
            val,
            next: None,
        }))
    }
}

/**
 * File: tree_node.rs
 * Created Time: 2023-02-27
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use std::cell::RefCell;
use std::rc::Rc;

#[allow(dead_code)]
pub struct TreeNode {
    pub val: i32,
    pub high: i32,
    pub parent: Option<Rc<RefCell<TreeNode>>>,
    pub left: Option<Rc<RefCell<TreeNode>>>,
    pub right: Option<Rc<RefCell<TreeNode>>>,
}

impl TreeNode {
    pub fn new(val: i32) -> Rc<RefCell<Self>> {
        Rc::new(RefCell::new(Self {
            val,
            high: 0,
            parent: None,
            left: None,
            right: None
        }))
    }
}
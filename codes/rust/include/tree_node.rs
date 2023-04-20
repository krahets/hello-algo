/**
 * File: tree_node.rs
 * Created Time: 2023-02-27
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */

use std::cell::RefCell;
use std::collections::VecDeque;
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

#[macro_export]
macro_rules! op_vec {
    ( $( $x:expr ),* ) => {
        vec![
            $( Option::from($x).map(|x| x) ),* 
        ]
    };
}

/// This function takes a vector of integers and generates a binary tree from it in a level order traversal manner.
/// The first element of the vector is used as the root node of the tree. Each node in the tree is represented by a `TreeNode` struct that has a value and pointers to its left and right children.
///
/// # Arguments
///
/// * `list` - A vector of integers to be used to generate the binary tree.
///
/// # Returns
///
/// An `Option<Rc<RefCell<TreeNode>>>` where the `Option` is `None` if the vector is empty, and `Some` containing the root node of the tree otherwise.
///
/// # Examples
///
/// ```
/// use std::rc::Rc;
/// use std::cell::RefCell;
/// use std::collections::VecDeque;
///
/// let list = vec![1, 2, 3, 4, 5, 6, 7];
/// let root = vec_to_tree(list).unwrap();
///
/// // The resulting tree looks like:
/// //
/// //        1
/// //       / \
/// //      2   3
/// //     / \ / \
/// //    4   56  7
/// ```
pub fn vec_to_tree(list: Vec<Option<i32>>) -> Option<Rc<RefCell<TreeNode>>> {
    if list.is_empty() {
        return None;
    }

    let root = TreeNode::new(list[0].unwrap());
    let mut que = VecDeque::new();
    que.push_back(Rc::clone(&root));

    let mut index = 0;
    while let Some(node) = que.pop_front() {
        index += 1;
        if index >= list.len() {
            break;
        }
        if let Some(val) = list[index] {
            node.borrow_mut().left = Some(TreeNode::new(val));
            que.push_back(Rc::clone(&node.borrow().left.as_ref().unwrap()));
        }

        index += 1;
        if index >= list.len() {
            break;
        }
        if let Some(val) = list[index] {
            node.borrow_mut().right = Some(TreeNode::new(val));
            que.push_back(Rc::clone(&node.borrow().right.as_ref().unwrap()));
        }
    }
    Some(root)
}
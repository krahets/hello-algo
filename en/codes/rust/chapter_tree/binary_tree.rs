/**
 * File: binary_tree.rs
 * Created Time: 2023-02-27
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */
use std::rc::Rc;
include!("../include/include.rs");
use tree_node::TreeNode;

/* Driver Code */
fn main() {
    /* Initialize binary tree */
    // Initialize node
    let n1 = TreeNode::new(1);
    let n2 = TreeNode::new(2);
    let n3 = TreeNode::new(3);
    let n4 = TreeNode::new(4);
    let n5 = TreeNode::new(5);
    // Construct node references (pointers)
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().right = Some(Rc::clone(&n3));
    n2.borrow_mut().left = Some(Rc::clone(&n4));
    n2.borrow_mut().right = Some(Rc::clone(&n5));
    println!("\nInitialize binary tree\n");
    print_util::print_tree(&n1);

    // Inserting and removing nodes
    let p = TreeNode::new(0);
    // Insert node P between n1 -> n2
    p.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().left = Some(Rc::clone(&p));
    println!("\nAfter inserting node P\n");
    print_util::print_tree(&n1);
    // Remove node P
    drop(p);
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    println!("\nAfter removing node P\n");
    print_util::print_tree(&n1);
}

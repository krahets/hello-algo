/**
 * File: binary_tree.rs
 * Created Time: 2023-02-27
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */
use std::rc::Rc;
use hello_algo_rust::include::{print_util, TreeNode};

/* Driver code */
fn main() {
    /* Initialize the binary tree */
    // Initialize the nodes
    let n1 = TreeNode::new(1);
    let n2 = TreeNode::new(2);
    let n3 = TreeNode::new(3);
    let n4 = TreeNode::new(4);
    let n5 = TreeNode::new(5);
    // Set up references (pointers) between the nodes
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().right = Some(Rc::clone(&n3));
    n2.borrow_mut().left = Some(Rc::clone(&n4));
    n2.borrow_mut().right = Some(Rc::clone(&n5));
    println!("\nInitialize the binary tree\n");
    print_util::print_tree(&n1);

    // Insert and remove nodes
    let p = TreeNode::new(0);
    // Insert node p between n1 and n2 in n1 -> n2
    p.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().left = Some(Rc::clone(&p));
    println!("\nAfter inserting node p:\n");
    print_util::print_tree(&n1);
    // Remove node p
    drop(p);
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    println!("\nAfter removing node p:\n");
    print_util::print_tree(&n1);
}

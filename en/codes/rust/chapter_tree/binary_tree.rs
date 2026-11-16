/**
 * File: binary_tree.rs
 * Created Time: 2023-02-27
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */
use std::rc::Rc;
use hello_algo_rust::include::{print_util, TreeNode};

/* Driver code */
fn main() {
    // [region]{init_binary_tree}
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
    // [endregion]{init_binary_tree}
    println!("\nInitialize the binary tree\n");
    print_util::print_tree(&n1);

    // [region]{insert_node}
    /* Insert and remove nodes */
    let p = TreeNode::new(0);
    // Insert node P between n1 and n2 in n1 -> n2
    p.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().left = Some(Rc::clone(&p));
    // [endregion]{insert_node}
    println!("\nAfter inserting node P:\n");
    print_util::print_tree(&n1);
    // [region]{remove_node}
    // Remove node P
    drop(p);
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    // [endregion]{remove_node}
    println!("\nAfter removing node P:\n");
    print_util::print_tree(&n1);
}

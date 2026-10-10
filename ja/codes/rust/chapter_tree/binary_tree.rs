/**
 * File: binary_tree.rs
 * Created Time: 2023-02-27
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */
use std::rc::Rc;
use hello_algo_rust::include::{print_util, TreeNode};

/* Driver Code */
fn main() {
    /* 二分木を初期化 */
    // ノードを初期化
    let n1 = TreeNode::new(1);
    let n2 = TreeNode::new(2);
    let n3 = TreeNode::new(3);
    let n4 = TreeNode::new(4);
    let n5 = TreeNode::new(5);
    // ノード間の参照（ポインタ）を構築する
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().right = Some(Rc::clone(&n3));
    n2.borrow_mut().left = Some(Rc::clone(&n4));
    n2.borrow_mut().right = Some(Rc::clone(&n5));
    println!("\n二分木を初期化\n");
    print_util::print_tree(&n1);

    // ノードの挿入と削除
    let p = TreeNode::new(0);
    // n1 -> n2 の間にノード P を挿入
    p.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().left = Some(Rc::clone(&p));
    println!("\nノード P を挿入した後\n");
    print_util::print_tree(&n1);
    // ノード P を削除
    drop(p);
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    println!("\nノード P を削除した後\n");
    print_util::print_tree(&n1);
}

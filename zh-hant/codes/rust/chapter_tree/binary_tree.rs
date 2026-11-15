/**
 * File: binary_tree.rs
 * Created Time: 2023-02-27
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */
use std::rc::Rc;
use hello_algo_rust::include::{print_util, TreeNode};

/* Driver Code */
fn main() {
    // [region]{init_binary_tree}
    /* 初始化二元樹 */
    // 初始化節點
    let n1 = TreeNode::new(1);
    let n2 = TreeNode::new(2);
    let n3 = TreeNode::new(3);
    let n4 = TreeNode::new(4);
    let n5 = TreeNode::new(5);
    // 構建節點之間的引用（指標）
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().right = Some(Rc::clone(&n3));
    n2.borrow_mut().left = Some(Rc::clone(&n4));
    n2.borrow_mut().right = Some(Rc::clone(&n5));
    // [endregion]{init_binary_tree}
    println!("\n初始化二元樹\n");
    print_util::print_tree(&n1);

    // [region]{insert_node}
    // 插入節點與刪除節點
    let p = TreeNode::new(0);
    // 在 n1 -> n2 中間插入節點 P
    p.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().left = Some(Rc::clone(&p));
    // [endregion]{insert_node}
    println!("\n插入節點 P 後\n");
    print_util::print_tree(&n1);
    // [region]{remove_node}
    // 刪除節點 P
    drop(p);
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    // [endregion]{remove_node}
    println!("\n刪除節點 P 後\n");
    print_util::print_tree(&n1);
}

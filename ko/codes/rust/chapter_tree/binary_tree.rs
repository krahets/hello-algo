/**
 * File: binary_tree.rs
 * Created Time: 2023-02-27
 * Author: xBLACKICEx (xBLACKICE@outlook.com)
 */
use std::rc::Rc;
use hello_algo_rust::include::{print_util, TreeNode};

/* 실행 코드 */
fn main() {
    /* 이진 트리 초기화 */
    // 노드 초기화
    let n1 = TreeNode::new(1);
    let n2 = TreeNode::new(2);
    let n3 = TreeNode::new(3);
    let n4 = TreeNode::new(4);
    let n5 = TreeNode::new(5);
    // 노드 사이의 참조(포인터)를 설정한다
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().right = Some(Rc::clone(&n3));
    n2.borrow_mut().left = Some(Rc::clone(&n4));
    n2.borrow_mut().right = Some(Rc::clone(&n5));
    println!("\n이진 트리 초기화\n");
    print_util::print_tree(&n1);

    // 노드 삽입과 삭제
    let p = TreeNode::new(0);
    // n1 -> n2 사이에 노드 P를 삽입한다
    p.borrow_mut().left = Some(Rc::clone(&n2));
    n1.borrow_mut().left = Some(Rc::clone(&p));
    println!("\n노드 P를 삽입한 후\n");
    print_util::print_tree(&n1);
    // 노드 P를 삭제한다
    drop(p);
    n1.borrow_mut().left = Some(Rc::clone(&n2));
    println!("\n노드 P를 삭제한 후\n");
    print_util::print_tree(&n1);
}

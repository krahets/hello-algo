/*
 * File: linked_list.rs
 * Created Time: 2023-03-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};
use std::cell::RefCell;
use std::rc::Rc;

/* 連結リストのノード n0 の直後にノード P を挿入する */
#[allow(non_snake_case)]
pub fn insert<T>(n0: &Rc<RefCell<ListNode<T>>>, P: Rc<RefCell<ListNode<T>>>) {
    let n1 = n0.borrow_mut().next.take();
    P.borrow_mut().next = n1;
    n0.borrow_mut().next = Some(P);
}

/* 連結リストのノード n0 の直後のノードを削除する */
#[allow(non_snake_case)]
pub fn remove<T>(n0: &Rc<RefCell<ListNode<T>>>) {
    // n0 -> P -> n1
    let P = n0.borrow_mut().next.take();
    if let Some(node) = P {
        let n1 = node.borrow_mut().next.take();
        n0.borrow_mut().next = n1;
    }
}

/* 連結リストのインデックス index にあるノードにアクセスする */
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

/* 連結リストから値が target である最初のノードを探索する */
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

/* 実行用コード */
fn main() {
    /* 連結リストを初期化する */
    // 各ノードを初期化する
    let n0 = ListNode::new(1);
    let n1 = ListNode::new(3);
    let n2 = ListNode::new(2);
    let n3 = ListNode::new(5);
    let n4 = ListNode::new(4);
    // ノード間の参照を設定する
    n0.borrow_mut().next = Some(n1.clone());
    n1.borrow_mut().next = Some(n2.clone());
    n2.borrow_mut().next = Some(n3.clone());
    n3.borrow_mut().next = Some(n4.clone());
    print!("初期化した連結リスト ");
    print_util::print_linked_list(&n0);

    /* ノードを挿入する */
    insert(&n0, ListNode::new(0));
    print!("ノードを挿入した後の連結リスト ");
    print_util::print_linked_list(&n0);

    /* ノードを削除する */
    remove(&n0);
    print!("ノードを削除した後の連結リスト ");
    print_util::print_linked_list(&n0);

    /* ノードにアクセスする */
    let node = access(n0.clone(), 3);
    println!("連結リストのインデックス 3 にあるノードの値 = {}", node.unwrap().borrow().val);

    /* ノードを探索する */
    let index = find(n0.clone(), 2);
    println!("連結リスト内で値が 2 であるノードのインデックス = {}", index);
}

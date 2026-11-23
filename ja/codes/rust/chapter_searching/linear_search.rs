/*
 * File: linear_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::rc::Rc;

/* 線形探索（配列） */
fn linear_search_array(nums: &[i32], target: i32) -> i32 {
    // 配列を走査する
    for (i, num) in nums.iter().enumerate() {
        // 目的の要素が見つかったので、そのインデックスを返す
        if num == &target {
            return i as i32;
        }
    }
    // 目的の要素が見つからなかったので、-1 を返す
    return -1;
}

/* 線形探索（連結リスト） */
fn linear_search_linked_list(
    head: Rc<RefCell<ListNode<i32>>>,
    target: i32,
) -> Option<Rc<RefCell<ListNode<i32>>>> {
    // 目的のノードが見つかったので、それを返す
    if head.borrow().val == target {
        return Some(head);
    };
    // 目的のノードが見つかったので、それを返す
    if let Some(node) = &head.borrow_mut().next {
        return linear_search_linked_list(node.clone(), target);
    }
    // 目的のノードが見つからなかったので、None を返す
    return None;
}

/* 実行用コード */
pub fn main() {
    let target = 3;

    /* 配列で線形探索を行う */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    let index = linear_search_array(&nums, target);
    println!("目的の要素 3 のインデックス = {}", index);

    /* 連結リストで線形探索を行う */
    let head = ListNode::arr_to_linked_list(&nums);
    let node = linear_search_linked_list(head.unwrap(), target);
    println!("目的のノードの値 3 に対応するノードオブジェクトは {:?}", node);
}

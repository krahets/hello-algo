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
    // 配列を走査
    for (i, num) in nums.iter().enumerate() {
        // 目標要素が見つかったらそのインデックスを返す
        if num == &target {
            return i as i32;
        }
    }
    // 目標要素が見つからなければ -1 を返す
    return -1;
}

/* 線形探索（連結リスト） */
fn linear_search_linked_list(
    head: Rc<RefCell<ListNode<i32>>>,
    target: i32,
) -> Option<Rc<RefCell<ListNode<i32>>>> {
    // 対象ノードが見つかったら、それを返す
    if head.borrow().val == target {
        return Some(head);
    };
    // 対象ノードが見つかったら、それを返す
    if let Some(node) = &head.borrow_mut().next {
        return linear_search_linked_list(node.clone(), target);
    }
    // 対象ノードが見つからない場合は None を返す
    return None;
}

/* Driver Code */
pub fn main() {
    let target = 3;

    /* 配列で線形探索を行う */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    let index = linear_search_array(&nums, target);
    println!("対象要素 3 のインデックス = {}", index);

    /* 連結リストで線形探索を行う */
    let head = ListNode::arr_to_linked_list(&nums);
    let node = linear_search_linked_list(head.unwrap(), target);
    println!("対象ノード値 3 に対応するノードオブジェクトは {:?}", node);
}

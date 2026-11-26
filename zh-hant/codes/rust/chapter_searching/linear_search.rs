/*
 * File: linear_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::rc::Rc;

/* 循序搜尋（陣列） */
fn linear_search_array(nums: &[i32], target: i32) -> i32 {
    // 走訪陣列
    for (i, num) in nums.iter().enumerate() {
        // 找到目標元素，回傳其索引
        if num == &target {
            return i as i32;
        }
    }
    // 找不到目標元素，回傳 -1
    return -1;
}

/* 循序搜尋（鏈結串列） */
fn linear_search_linked_list(
    head: Rc<RefCell<ListNode<i32>>>,
    target: i32,
) -> Option<Rc<RefCell<ListNode<i32>>>> {
    // 找到目標節點，回傳該節點
    if head.borrow().val == target {
        return Some(head);
    };
    // 找到目標節點，回傳該節點
    if let Some(node) = &head.borrow_mut().next {
        return linear_search_linked_list(node.clone(), target);
    }
    // 找不到目標節點，回傳 None
    return None;
}

/* 主程式 */
pub fn main() {
    let target = 3;

    /* 在陣列中執行循序搜尋 */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    let index = linear_search_array(&nums, target);
    println!("目標元素 3 的索引 = {}", index);

    /* 在鏈結串列中執行循序搜尋 */
    let head = ListNode::arr_to_linked_list(&nums);
    let node = linear_search_linked_list(head.unwrap(), target);
    println!("目標值 3 對應的節點物件為 {:?}", node);
}

/*
 * File: linear_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::rc::Rc;

/* 线性查找（数组） */
fn linear_search_array(nums: &[i32], target: i32) -> i32 {
    // 遍历数组
    for (i, num) in nums.iter().enumerate() {
        // 找到目标元素，返回其索引
        if num == &target {
            return i as i32;
        }
    }
    // 未找到目标元素，返回 -1
    return -1;
}

/* 线性查找（链表） */
fn linear_search_linked_list(
    head: Rc<RefCell<ListNode<i32>>>,
    target: i32,
) -> Option<Rc<RefCell<ListNode<i32>>>> {
    // 找到目标节点，返回之
    if head.borrow().val == target {
        return Some(head);
    };
    // 找到目标节点，返回之
    if let Some(node) = &head.borrow_mut().next {
        return linear_search_linked_list(node.clone(), target);
    }
    // 未找到目标节点，返回 None
    return None;
}

/* Driver Code */
pub fn main() {
    let target = 3;

    /* 在数组中执行线性查找 */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    let index = linear_search_array(&nums, target);
    println!("目标元素 3 的索引 = {}", index);

    /* 在链表中执行线性查找 */
    let head = ListNode::arr_to_linked_list(&nums);
    let node = linear_search_linked_list(head.unwrap(), target);
    println!("目标节点值 3 的对应节点对象为 {:?}", node);
}

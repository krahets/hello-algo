/*
 * File: linear_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::rc::Rc;

/* Linear search in an array */
fn linear_search_array(nums: &[i32], target: i32) -> i32 {
    // Traverse the array
    for (i, num) in nums.iter().enumerate() {
        // Found the target. Return its index
        if num == &target {
            return i as i32;
        }
    }
    // Target not found. Return -1
    return -1;
}

/* Linear search in a linked list */
fn linear_search_linked_list(
    head: Rc<RefCell<ListNode<i32>>>,
    target: i32,
) -> Option<Rc<RefCell<ListNode<i32>>>> {
    // Found the target node. Return it
    if head.borrow().val == target {
        return Some(head);
    };
    // Found the target node. Return it
    if let Some(node) = &head.borrow_mut().next {
        return linear_search_linked_list(node.clone(), target);
    }
    // Target node not found. Return None
    return None;
}

/* Driver code */
pub fn main() {
    let target = 3;

    /* Run linear search on the array */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    let index = linear_search_array(&nums, target);
    println!("Index of target 3 = {}", index);

    /* Run linear search on the linked list */
    let head = ListNode::arr_to_linked_list(&nums);
    let node = linear_search_linked_list(head.unwrap(), target);
    println!("Node object for target value 3 = {:?}", node);
}

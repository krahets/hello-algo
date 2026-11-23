/*
 * File: linear_search.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::ListNode;
use std::cell::RefCell;
use std::rc::Rc;

/* Linear search (array) */
fn linear_search_array(nums: &[i32], target: i32) -> i32 {
    // Traverse the array
    for (i, num) in nums.iter().enumerate() {
        // The target element was found; return its index
        if num == &target {
            return i as i32;
        }
    }
    // The target element was not found; return -1
    return -1;
}

/* Linear search (linked list) */
fn linear_search_linked_list(
    head: Rc<RefCell<ListNode<i32>>>,
    target: i32,
) -> Option<Rc<RefCell<ListNode<i32>>>> {
    // Search for the target node and return it if found
    if head.borrow().val == target {
        return Some(head);
    };
    // Search for the target node and return it if found
    if let Some(node) = &head.borrow_mut().next {
        return linear_search_linked_list(node.clone(), target);
    }
    // The target node was not found; return None
    return None;
}

/* Driver code */
pub fn main() {
    let target = 3;

    /* Perform linear search on the array */
    let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
    let index = linear_search_array(&nums, target);
    println!("Index of target element 3 = {}", index);

    /* Perform linear search on the linked list */
    let head = ListNode::arr_to_linked_list(&nums);
    let node = linear_search_linked_list(head.unwrap(), target);
    println!("Node corresponding to target value 3: {:?}", node);
}

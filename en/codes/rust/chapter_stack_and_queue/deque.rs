/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* Driver code */
pub fn main() {
    // Initialize the deque
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("Deque deque = ");
    print_util::print_queue(&deque);

    // Access an element
    let peek_first = deque.front().unwrap();
    print!("\nFront element peek_first = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\nRear element peek_last = {peek_last}");

    /* Enqueue elements */
    deque.push_back(4);
    print!("\nAfter enqueuing element 4 at the rear, deque = ");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\nAfter enqueuing element 1 at the front, deque = ");
    print_util::print_queue(&deque);

    // Dequeue an element
    let pop_last = deque.pop_back().unwrap();
    print!("\nElement removed from the rear = {pop_last}; after removal, deque = ");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\nElement removed from the front = {pop_first}; after removal, deque = ");
    print_util::print_queue(&deque);

    // Get the deque size
    let size = deque.len();
    print!("\nDeque size = {size}");

    // Check whether the deque is empty
    let is_empty = deque.is_empty();
    print!("\nIs the deque empty? {is_empty}");
}

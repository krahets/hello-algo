/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

include!("../include/include.rs");

use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // Initialize double-ended queue
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("Double-ended queue deque =");
    print_util::print_queue(&deque);

    // Access element
    let peek_first = deque.front().unwrap();
    print!("\nFront element peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\nBack element peekLast = {peek_last}");

    /* Element enqueue */
    deque.push_back(4);
    print!("\nElement 4 enqueued at the tail, deque = ");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\nElement 1 enqueued at the head, deque = ");
    print_util::print_queue(&deque);

    // Element dequeue
    let pop_last = deque.pop_back().unwrap();
    print!("\nDeque tail element = {pop_last}, after dequeuing from the tail");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\nDeque front element = {pop_first}, after dequeuing from the front");
    print_util::print_queue(&deque);

    // Get the length of the double-ended queue
    let size = deque.len();
    print!("\nLength of the double-ended queue size = {size}");

    // Determine if the double-ended queue is empty
    let is_empty = deque.is_empty();
    print!("\nIs the double-ended queue empty = {is_empty}");
}

/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // Get the length of the double-ended queue
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("Double-ended queue deque = ");
    print_util::print_queue(&deque);

    // Update element
    let peek_first = deque.front().unwrap();
    print!("\nFront element peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\nRear element peekLast = {peek_last}");

    /* Elements enqueue */
    deque.push_back(4);
    print!("\nAfter element 4 enqueues at rear, deque = ");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\nAfter element 1 enqueues at front, deque = ");
    print_util::print_queue(&deque);

    // Element dequeue
    let pop_last = deque.pop_back().unwrap();
    print!("\nDequeue rear element = {pop_last}, after dequeue deque = ");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\nDequeue front element = {pop_first}, after dequeue deque = ");
    print_util::print_queue(&deque);

    // Get the length of the double-ended queue
    let size = deque.len();
    print!("\nDeque length size = {size}");

    // Check if the double-ended queue is empty
    let is_empty = deque.is_empty();
    print!("\nIs deque empty = {is_empty}");
}

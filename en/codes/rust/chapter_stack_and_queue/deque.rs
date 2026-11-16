/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* Driver code */
pub fn main() {
    // [region]{init_deque}
    // Initialize the deque
    let mut deque: VecDeque<i32> = VecDeque::new();
    // [endregion]{init_deque}

    // [region]{push}
    /* Enqueue elements */
    deque.push_back(2); // Add to the rear
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // Add to the front
    deque.push_front(1);
    // [endregion]{push}
    print!("Deque deque = ");
    print_util::print_queue(&deque);

    // [region]{peek_first}
    // Access an element
    let peek_first = deque.front().unwrap(); // Front element
    // [endregion]{peek_first}
    print!("\nFront element peekFirst = {peek_first}");
    // [region]{peek_last}
    let peek_last = deque.back().unwrap(); // Rear element
    // [endregion]{peek_last}
    print!("\nRear element peekLast = {peek_last}");

    // [region]{pop_first}
    // Dequeue an element
    let pop_first = deque.pop_front().unwrap(); // Dequeue the front element
    // [endregion]{pop_first}
    print!("\nElement removed from the front = {pop_first}; after removal, deque = ");
    print_util::print_queue(&deque);
    // [region]{pop_last}
    let pop_last = deque.pop_back().unwrap(); // Dequeue the rear element
    // [endregion]{pop_last}
    print!("\nElement removed from the rear = {pop_last}; after removal, deque = ");
    print_util::print_queue(&deque);

    // [region]{size}
    // Get the deque size
    let size = deque.len();
    // [endregion]{size}
    print!("\nDeque size = {size}");

    // [region]{is_empty}
    // Check whether the deque is empty
    let is_empty = deque.is_empty();
    // [endregion]{is_empty}
    print!("\nIs the deque empty? {is_empty}");
}

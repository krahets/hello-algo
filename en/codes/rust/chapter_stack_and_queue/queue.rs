/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* Driver code */
pub fn main() {
    // [region]{init_queue}
    // Initialize the queue
    // In Rust, the deque VecDeque is commonly used as a queue
    let mut queue: VecDeque<i32> = VecDeque::new();
    // [endregion]{init_queue}

    // [region]{push}
    // Enqueue elements
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    // [endregion]{push}
    print!("Queue queue = ");
    print_util::print_queue(&queue);

    // [region]{peek}
    // Access the front element
    let peek = queue.front().unwrap();
    // [endregion]{peek}
    println!("\nFront element peek = {peek}");

    // [region]{pop}
    // Dequeue an element
    let pop = queue.pop_front().unwrap();
    // [endregion]{pop}
    print!("Dequeued element pop = {pop}; after dequeueing, queue = ");
    print_util::print_queue(&queue);

    // [region]{size}
    // Get the queue size
    let size = queue.len();
    // [endregion]{size}
    print!("\nQueue size = {size}");

    // [region]{is_empty}
    // Check whether the queue is empty
    let is_empty = queue.is_empty();
    // [endregion]{is_empty}
    print!("\nIs the queue empty? {is_empty}");
}

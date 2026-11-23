/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* Driver code */
pub fn main() {
    // Initialize the queue
    let mut queue: VecDeque<i32> = VecDeque::new();

    // Enqueue elements
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    print!("Queue queue = ");
    print_util::print_queue(&queue);

    // Access the front element
    let peek = queue.front().unwrap();
    println!("\nFront element peek = {peek}");

    // Dequeue an element
    let pop = queue.pop_front().unwrap();
    print!("Dequeued element pop = {pop}; after dequeueing, queue = ");
    print_util::print_queue(&queue);

    // Get the queue size
    let size = queue.len();
    print!("\nQueue size = {size}");

    // Check whether the queue is empty
    let is_empty = queue.is_empty();
    print!("\nIs the queue empty? {is_empty}");
}

/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

include!("../include/include.rs");

use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // Initialize queue
    let mut queue: VecDeque<i32> = VecDeque::new();

    // Element enqueue
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    print!("Queue queue =");
    print_util::print_queue(&queue);

    // Access front element
    let peek = queue.front().unwrap();
    println!("\nFront element peek = {peek}");

    // Element dequeue
    let pop = queue.pop_front().unwrap();
    print!("Dequeued element = {pop}, after dequeuing queue = ");
    print_util::print_queue(&queue);

    // Get the length of the queue
    let size = queue.len();
    print!("\nLength of the queue size = {size}");

    // Determine if the queue is empty
    let is_empty = queue.is_empty();
    print!("\nIs the queue empty = {is_empty}");
}

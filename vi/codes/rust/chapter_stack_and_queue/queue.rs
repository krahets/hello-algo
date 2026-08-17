/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // Access front of the queue element
    let mut queue: VecDeque<i32> = VecDeque::new();

    // Elements enqueue
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    print!("Queue queue = ");
    print_util::print_queue(&queue);

    // Return list for printing
    let peek = queue.front().unwrap();
    println!("\nFront element peek = {peek}");

    // Element dequeue
    let pop = queue.pop_front().unwrap();
    print!("Dequeue element pop = {pop}, after dequeue queue = ");
    print_util::print_queue(&queue);

    // Get the length of the queue
    let size = queue.len();
    print!("\nQueue length size = {size}");

    // Check if the queue is empty
    let is_empty = queue.is_empty();
    print!("\nIs queue empty = {is_empty}");
}

/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

// [region]{import}
use std::{cmp::Reverse, collections::BinaryHeap};
// [endregion]{import}

/* Driver code */
fn main() {
    // [region]{init}
    /* Initialize the heap */
    // Initialize a min heap
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust's BinaryHeap is a max heap; wrapping elements in Reverse gives min heap ordering
    // Initialize a max heap
    let mut max_heap = BinaryHeap::new();
    // [endregion]{init}

    println!("\nThe following example uses a max heap");

    // [region]{push}
    /* Push an element onto the heap */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);
    // [endregion]{push}
    print_util::print_heap(max_heap.iter().map(|&val| val).collect());

    // [region]{peek}
    /* Get the top element of the heap */
    let peek = max_heap.peek().unwrap(); // 5
    // [endregion]{peek}
    println!("\nTop element: {}", peek);

    // [region]{pop_1}
    /* Pop the top element from the heap */
    // The elements are popped in descending order
    let peek = max_heap.pop().unwrap(); // 5
    // [endregion]{pop_1}
    println!("{}", peek);
    // [region]{pop_2}
    let peek = max_heap.pop().unwrap(); // 4
    // [endregion]{pop_2}
    println!("{}", peek);
    // [region]{pop_3}
    let peek = max_heap.pop().unwrap(); // 3
    // [endregion]{pop_3}
    println!("{}", peek);
    // [region]{pop_4}
    let peek = max_heap.pop().unwrap(); // 2
    // [endregion]{pop_4}
    println!("{}", peek);
    // [region]{pop_5}
    let peek = max_heap.pop().unwrap(); // 1
    // [endregion]{pop_5}
    println!("{}", peek);

    // [region]{size}
    /* Get the heap size */
    let size = max_heap.len();
    // [endregion]{size}
    println!("\nNumber of heap elements: {}", size);

    // [region]{is_empty}
    /* Check whether the heap is empty */
    let is_empty = max_heap.is_empty();
    // [endregion]{is_empty}
    println!("\nIs the heap empty? {}", is_empty);

    // [region]{heapify}
    /* Build a heap from an input list */
    // The time complexity is O(n), not O(nlogn)
    min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
    // [endregion]{heapify}
    println!("\nAfter building a min heap from the input list:");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

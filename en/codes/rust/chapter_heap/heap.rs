/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::{cmp::Reverse, collections::BinaryHeap};

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // Push an element onto the heap
    println!("\nHeap after pushing {}:", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("\nHeap after popping the root ({}):", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

/* Driver code */
fn main() {
    /* Initialize the heap */
    // Initialize a min-heap
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust's BinaryHeap is a max-heap. To make a min-heap, wrap the elements in Reverse
    // Initialize a max-heap
    let mut max_heap = BinaryHeap::new();

    println!("\nThe following example uses a max-heap");

    /* Push an element onto the heap */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* Get the root element */
    let peek = max_heap.peek().unwrap();
    println!("\nRoot element: {}", peek);

    /* Pop the root */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* Get the heap size */
    let size = max_heap.len();
    println!("\nNumber of elements in the heap: {}", size);

    /* Check whether the heap is empty */
    let is_empty = max_heap.is_empty();
    println!("\nIs the heap empty? {}", is_empty);

    /* Build a heap from the input list */
    // The time complexity is O(n), rather than O(nlogn)
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| Reverse(val))
            .collect::<Vec<Reverse<i32>>>(),
    );
    println!("\nMin-heap built from the input list:");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

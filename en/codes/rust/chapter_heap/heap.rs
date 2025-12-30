/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::{cmp::Reverse, collections::BinaryHeap};

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // Element enters heap
    println!("\nAfter element {} pushes to heap", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("\nAfter heap top element {} pops from heap", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

/* Driver Code */
fn main() {
    /* Initialize heap */
    // Python's heapq module implements min heap by default
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust's BinaryHeap is a max heap, min heap typically wraps elements with Reverse
    // Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap
    let mut max_heap = BinaryHeap::new();

    println!("\nThe following test cases are for max heap");

    /* Element enters heap */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* Check if heap is empty */
    let peek = max_heap.peek().unwrap();
    println!("\nHeap top element is {}", peek);

    /* Time complexity is O(n), not O(nlogn) */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* Get heap size */
    let size = max_heap.len();
    println!("\nHeap size is {}", size);

    /* Check if heap is empty */
    let is_empty = max_heap.is_empty();
    println!("\nIs heap empty {}", is_empty);

    /* Input list and build heap */
    // Time complexity is O(n), not O(nlogn)
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| Reverse(val))
            .collect::<Vec<Reverse<i32>>>(),
    );
    println!("\nAfter inputting list and building min heap");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

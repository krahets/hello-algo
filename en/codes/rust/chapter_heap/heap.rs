/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

use std::collections::BinaryHeap;

fn test_push(heap: &mut BinaryHeap<i32>, val: i32, flag: i32) {
    heap.push(flag * val); // Push the element into heap
    println!("\nElement {} after being added to the heap", val);
    print_util::print_heap(heap.iter().map(|&val| flag * val).collect());
}

fn test_pop(heap: &mut BinaryHeap<i32>, flag: i32) {
    let val = heap.pop().unwrap();
    println!("\nTop element {} after being removed from the heap", flag * val);
    print_util::print_heap(heap.iter().map(|&val| flag * val).collect());
}

/* Driver Code */
fn main() {
    /* Initialize the heap */
    // Initialize min-heap
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust's BinaryHeap is a max-heap, multiply the element value by -1 when enqueuing to reverse it, multiply by -1 again when dequeuing to restore it
    let min_heap_flag = -1;
    // Initialize max-heap
    let mut max_heap = BinaryHeap::new();
    let max_heap_flag = 1;

    println!("\nThe following test case is for max-heap");

    /* Push the element into heap */
    test_push(&mut max_heap, 1, max_heap_flag);
    test_push(&mut max_heap, 3, max_heap_flag);
    test_push(&mut max_heap, 2, max_heap_flag);
    test_push(&mut max_heap, 5, max_heap_flag);
    test_push(&mut max_heap, 4, max_heap_flag);

    /* Access heap top element */
    let peek = max_heap.peek().unwrap() * max_heap_flag;
    println!("\nThe top element of the heap is {}", peek);

    /* Pop the element at the heap top */
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);

    /* Get heap size */
    let size = max_heap.len();
    println!("\nThe number of elements in the heap is {}", size);

    /* Determine if heap is empty */
    let is_empty = max_heap.is_empty();
    println!("\nIs the heap empty {}", is_empty);

    /* Enter list and build heap */
    // Time complexity is O(n), not O(nlogn)
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| min_heap_flag * val)
            .collect::<Vec<i32>>(),
    );
    println!("\nEnter list and build min-heap");
    print_util::print_heap(min_heap.iter().map(|&val| min_heap_flag * val).collect());
}

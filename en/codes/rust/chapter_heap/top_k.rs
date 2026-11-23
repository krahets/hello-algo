/*
 * File: top_k.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cmp::Reverse;
use std::collections::BinaryHeap;

/* Use a heap to find the k largest elements in an array */
fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
    // BinaryHeap is a max heap; Reverse reverses the comparison order to implement a min heap
    let mut heap = BinaryHeap::<Reverse<i32>>::new();
    // Push the first k array elements onto the heap
    for &num in nums.iter().take(k) {
        heap.push(Reverse(num));
    }
    // Starting with element k+1, keep the heap size at k
    for &num in nums.iter().skip(k) {
        // If the current element is larger than the heap top, pop the top element and push the current element
        if num > heap.peek().unwrap().0 {
            heap.pop();
            heap.push(Reverse(num));
        }
    }
    heap
}

/* Driver code */
fn main() {
    let nums = vec![1, 7, 6, 3, 2];
    let k = 3;

    let res = top_k_heap(nums, k);
    println!("The largest {} elements are", k);
    print_util::print_heap(res.into_iter().map(|item| item.0).collect());
}

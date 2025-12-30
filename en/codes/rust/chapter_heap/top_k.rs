/*
 * File: top_k.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cmp::Reverse;
use std::collections::BinaryHeap;

/* Find the largest k elements in array based on heap */
fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
    // BinaryHeap is a max heap, use Reverse to negate elements to implement min heap
    let mut heap = BinaryHeap::<Reverse<i32>>::new();
    // Enter the first k elements of array into heap
    for &num in nums.iter().take(k) {
        heap.push(Reverse(num));
    }
    // Starting from the (k+1)th element, maintain heap length as k
    for &num in nums.iter().skip(k) {
        // If current element is greater than top element, top element exits heap, current element enters heap
        if num > heap.peek().unwrap().0 {
            heap.pop();
            heap.push(Reverse(num));
        }
    }
    heap
}

/* Driver Code */
fn main() {
    let nums = vec![1, 7, 6, 3, 2];
    let k = 3;

    let res = top_k_heap(nums, k);
    println!("The largest {} elements are", k);
    print_util::print_heap(res.into_iter().map(|item| item.0).collect());
}

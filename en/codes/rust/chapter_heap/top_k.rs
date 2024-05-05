/*
 * File: top_k.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

use std::cmp::Reverse;
use std::collections::BinaryHeap;

/* Using heap to find the largest k elements in an array */
fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
    // BinaryHeap is a max-heap, use Reverse to invert the elements, thus implementing a min-heap
    let mut heap = BinaryHeap::<Reverse<i32>>::new();
    // Enter the first k elements of the array into the heap
    for &num in nums.iter().take(k) {
        heap.push(Reverse(num));
    }
    // From the k+1th element, keep the heap length as k
    for &num in nums.iter().skip(k) {
        // If the current element is larger than the heap top element, remove the heap top element and enter the current element into the heap
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

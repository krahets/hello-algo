/*
 * File: top_k.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cmp::Reverse;
use std::collections::BinaryHeap;

/* 基于堆查找数组中最大的 k 个元素 */
fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
    // BinaryHeap 是大顶堆，使用 Reverse 将元素取反，从而实现小顶堆
    let mut heap = BinaryHeap::<Reverse<i32>>::new();
    // 将数组的前 k 个元素入堆
    for &num in nums.iter().take(k) {
        heap.push(Reverse(num));
    }
    // 从第 k+1 个元素开始，保持堆的长度为 k
    for &num in nums.iter().skip(k) {
        // 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
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
    println!("最大的 {} 个元素为", k);
    print_util::print_heap(res.into_iter().map(|item| item.0).collect());
}

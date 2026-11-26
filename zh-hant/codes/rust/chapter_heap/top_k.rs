/*
 * File: top_k.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cmp::Reverse;
use std::collections::BinaryHeap;

/* 以堆積找出陣列中最大的 k 個元素 */
fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
    // BinaryHeap 是最大堆積，可用 Reverse 反轉元素的比較順序來實作最小堆積
    let mut heap = BinaryHeap::<Reverse<i32>>::new();
    // 將陣列的前 k 個元素加入堆積
    for &num in nums.iter().take(k) {
        heap.push(Reverse(num));
    }
    // 從第 k+1 個元素開始，讓堆積大小維持在 k
    for &num in nums.iter().skip(k) {
        // 若目前元素大於堆積頂端元素，就取出頂端元素，再將目前元素加入堆積
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
    println!("最大的 {} 個元素為", k);
    print_util::print_heap(res.into_iter().map(|item| item.0).collect());
}

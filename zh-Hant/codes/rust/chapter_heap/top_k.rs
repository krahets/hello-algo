/*
 * File: top_k.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

use std::cmp::Reverse;
use std::collections::BinaryHeap;

/* 基於堆積查詢陣列中最大的 k 個元素 */
fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
    // BinaryHeap 是大頂堆積，使用 Reverse 將元素取反，從而實現小頂堆積
    let mut heap = BinaryHeap::<Reverse<i32>>::new();
    // 將陣列的前 k 個元素入堆積
    for &num in nums.iter().take(k) {
        heap.push(Reverse(num));
    }
    // 從第 k+1 個元素開始，保持堆積的長度為 k
    for &num in nums.iter().skip(k) {
        // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
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

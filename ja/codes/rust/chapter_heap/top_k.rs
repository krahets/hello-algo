/*
 * File: top_k.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cmp::Reverse;
use std::collections::BinaryHeap;

/* ヒープに基づいて配列中の最大の k 個の要素を探す */
fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
    // BinaryHeap は最大ヒープであり、Reverse で要素の順序を反転することで最小ヒープを実現する
    let mut heap = BinaryHeap::<Reverse<i32>>::new();
    // 配列の先頭 k 個の要素をヒープに追加
    for &num in nums.iter().take(k) {
        heap.push(Reverse(num));
    }
    // k+1 番目の要素から開始し、ヒープ長を k に保つ
    for &num in nums.iter().skip(k) {
        // 現在の要素がヒープ先頭より大きければ、ヒープ先頭を取り出して現在の要素を追加する
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
    println!("最大の {} 個の要素は", k);
    print_util::print_heap(res.into_iter().map(|item| item.0).collect());
}

/*
 * File: top_k.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cmp::Reverse;
use std::collections::BinaryHeap;

/* ヒープを使って配列の上位 k 個の要素を求める */
fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
    // BinaryHeap は最大ヒープなので、Reverse で要素の大小関係を反転して最小ヒープを実現する
    let mut heap = BinaryHeap::<Reverse<i32>>::new();
    // 配列の先頭 k 個の要素をヒープに入れる
    for &num in nums.iter().take(k) {
        heap.push(Reverse(num));
    }
    // k+1 番目の要素からはヒープのサイズを k に保つ
    for &num in nums.iter().skip(k) {
        // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
        if num > heap.peek().unwrap().0 {
            heap.pop();
            heap.push(Reverse(num));
        }
    }
    heap
}

/* 実行例 */
fn main() {
    let nums = vec![1, 7, 6, 3, 2];
    let k = 3;

    let res = top_k_heap(nums, k);
    println!("上位 {} 個の要素：", k);
    print_util::print_heap(res.into_iter().map(|item| item.0).collect());
}

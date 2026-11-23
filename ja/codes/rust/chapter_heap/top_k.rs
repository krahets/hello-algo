/*
 * File: top_k.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cmp::Reverse;
use std::collections::BinaryHeap;

/* ヒープを使って配列内の大きいほうから k 個の要素を求める */
fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
    // BinaryHeap は最大ヒープなので、Reverse で要素の順序を反転して最小ヒープを実装する
    let mut heap = BinaryHeap::<Reverse<i32>>::new();
    // 配列の先頭 k 個の要素をヒープに挿入する
    for &num in nums.iter().take(k) {
        heap.push(Reverse(num));
    }
    // k+1 番目の要素から始め、ヒープの長さを k に保つ
    for &num in nums.iter().skip(k) {
        // 現在の要素がヒープの先頭要素より大きい場合、先頭要素を取り出し、現在の要素を挿入する
        if num > heap.peek().unwrap().0 {
            heap.pop();
            heap.push(Reverse(num));
        }
    }
    heap
}

/* 実行用コード */
fn main() {
    let nums = vec![1, 7, 6, 3, 2];
    let k = 3;

    let res = top_k_heap(nums, k);
    println!("大きいほうから {} 個の要素は", k);
    print_util::print_heap(res.into_iter().map(|item| item.0).collect());
}

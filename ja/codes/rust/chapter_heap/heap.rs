/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::{cmp::Reverse, collections::BinaryHeap};

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // 要素をヒープに挿入する
    println!("\n要素 {} の挿入後：", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("\n根の要素 {} を取り出した後：", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

/* 実行例 */
fn main() {
    /* ヒープを初期化する */
    // 最小ヒープを初期化する
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust の BinaryHeap は最大ヒープ。最小ヒープには通常 Reverse をかぶせる
    // 最大ヒープを初期化する
    let mut max_heap = BinaryHeap::new();

    println!("\n以下は最大ヒープのテスト例");

    /* 要素をヒープに挿入する */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* ヒープの根の要素を取得する */
    let peek = max_heap.peek().unwrap();
    println!("\nヒープの根の要素：{}", peek);

    /* 根の要素を取り出す */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* ヒープのサイズを取得する */
    let size = max_heap.len();
    println!("\nヒープの要素数：{}", size);

    /* ヒープが空か判定する */
    let is_empty = max_heap.is_empty();
    println!("\nヒープは空か：{}", is_empty);

    /* 入力リストからヒープを構築する */
    // 時間計算量は O(nlogn) ではなく O(n)
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| Reverse(val))
            .collect::<Vec<Reverse<i32>>>(),
    );
    println!("\n入力リストから構築した最小ヒープ：");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

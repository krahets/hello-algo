/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::{cmp::Reverse, collections::BinaryHeap};

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // 要素をヒープに追加
    println!("\n要素 {} をヒープに追加した後", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("\nヒープ先頭要素 {} を取り出した後", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

/* Driver Code */
fn main() {
    /* ヒープを初期化 */
    // 最小ヒープを初期化
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust の BinaryHeap は最大ヒープであり、最小ヒープには通常 Reverse を使う
    // 最大ヒープを初期化する
    let mut max_heap = BinaryHeap::new();

    println!("\n以下のテストケースは最大ヒープです");

    /* 要素をヒープに追加 */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* ヒープ頂点の要素を取得 */
    let peek = max_heap.peek().unwrap();
    println!("\nヒープ先頭要素は {}", peek);

    /* ヒープ頂点の要素を取り出す */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* ヒープのサイズを取得 */
    let size = max_heap.len();
    println!("\nヒープ要素数は {}", size);

    /* ヒープが空かどうかを判定 */
    let is_empty = max_heap.is_empty();
    println!("\nヒープは空か {}", is_empty);

    /* リストを入力してヒープを構築 */
    // 時間計算量は O(n) であり、O(nlogn) ではない
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| Reverse(val))
            .collect::<Vec<Reverse<i32>>>(),
    );
    println!("\nリストを入力して最小ヒープを構築した後");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

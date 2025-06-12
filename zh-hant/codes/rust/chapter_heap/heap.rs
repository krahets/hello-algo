/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::{cmp::Reverse, collections::BinaryHeap};

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // 元素入堆積
    println!("\n元素 {} 入堆積後", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}
fn test_push_min(heap: &mut BinaryHeap<Reverse<i32>>, val: i32) {
    heap.push(Reverse(val)); // 元素入堆積
    println!("\n元素 {} 入堆積後", val);
    print_util::print_heap(heap.iter().map(|&val| val.0).collect());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("\n堆積頂元素 {} 出堆積後", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}
fn test_pop_min(heap: &mut BinaryHeap<Reverse<i32>>) {
    let val = heap.pop().unwrap().0;
    println!("\n堆積頂元素 {} 出堆積後", val);
    print_util::print_heap(heap.iter().map(|&val| val.0).collect());
}

/* Driver Code */
fn main() {
    /* 初始化堆積 */
    // 初始化小頂堆積
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust 的 BinaryHeap 是大頂堆積，小頂堆積一般會“套上”Reverse
    // 初始化大頂堆積
    let mut max_heap = BinaryHeap::new();

    println!("\n以下測試樣例為大頂堆積");

    /* 元素入堆積 */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* 獲取堆積頂元素 */
    let peek = max_heap.peek().unwrap();
    println!("\n堆積頂元素為 {}", peek);

    /* 堆積頂元素出堆積 */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* 獲取堆積大小 */
    let size = max_heap.len();
    println!("\n堆積元素數量為 {}", size);

    /* 判斷堆積是否為空 */
    let is_empty = max_heap.is_empty();
    println!("\n堆積是否為空 {}", is_empty);

    /* 輸入串列並建堆積 */
    // 時間複雜度為 O(n) ，而非 O(nlogn)
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| Reverse(val))
            .collect::<Vec<Reverse<i32>>>(),
    );
    println!("\n輸入串列並建立小頂堆積後");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

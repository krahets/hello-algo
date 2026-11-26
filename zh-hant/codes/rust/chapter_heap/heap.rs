/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::{cmp::Reverse, collections::BinaryHeap};

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // 將元素加入堆積
    println!("\n將元素 {} 加入堆積後", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("\n取出堆積頂端元素 {} 後", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

/* Driver Code */
fn main() {
    /* 初始化堆積 */
    // 初始化最小堆積
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust 的 BinaryHeap 是最大堆積，實作最小堆積時通常用 Reverse 包裝元素
    // 初始化最大堆積
    let mut max_heap = BinaryHeap::new();

    println!("\n以下以最大堆積為測試案例");

    /* 將元素加入堆積 */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* 取得堆積頂端元素 */
    let peek = max_heap.peek().unwrap();
    println!("\n堆積頂端元素為 {}", peek);

    /* 取出堆積頂端元素 */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* 取得堆積大小 */
    let size = max_heap.len();
    println!("\n堆積中的元素個數為 {}", size);

    /* 判斷堆積是否為空 */
    let is_empty = max_heap.is_empty();
    println!("\n堆積是否為空 {}", is_empty);

    /* 以輸入串列建立堆積 */
    // 時間複雜度為 O(n)，而非 O(nlogn)
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| Reverse(val))
            .collect::<Vec<Reverse<i32>>>(),
    );
    println!("\n用輸入串列建立最小堆積後");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

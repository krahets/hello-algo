/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::{cmp::Reverse, collections::BinaryHeap};

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // 元素入堆
    println!("\n元素 {} 入堆后", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("\n堆顶元素 {} 出堆后", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

/* Driver Code */
fn main() {
    /* 初始化堆 */
    // 初始化小顶堆
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust 的 BinaryHeap 是大顶堆，小顶堆一般会“套上”Reverse
    // 初始化大顶堆
    let mut max_heap = BinaryHeap::new();

    println!("\n以下测试样例为大顶堆");

    /* 元素入堆 */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* 获取堆顶元素 */
    let peek = max_heap.peek().unwrap();
    println!("\n堆顶元素为 {}", peek);

    /* 堆顶元素出堆 */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* 获取堆大小 */
    let size = max_heap.len();
    println!("\n堆元素数量为 {}", size);

    /* 判断堆是否为空 */
    let is_empty = max_heap.is_empty();
    println!("\n堆是否为空 {}", is_empty);

    /* 输入列表并建堆 */
    // 时间复杂度为 O(n) ，而非 O(nlogn)
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| Reverse(val))
            .collect::<Vec<Reverse<i32>>>(),
    );
    println!("\n输入列表并建立小顶堆后");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

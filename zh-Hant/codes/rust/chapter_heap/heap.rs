/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

use std::collections::BinaryHeap;

fn test_push(heap: &mut BinaryHeap<i32>, val: i32, flag: i32) {
    heap.push(flag * val); // 元素入堆
    println!("\n元素 {} 入堆后", val);
    print_util::print_heap(heap.iter().map(|&val| flag * val).collect());
}

fn test_pop(heap: &mut BinaryHeap<i32>, flag: i32) {
    let val = heap.pop().unwrap();
    println!("\n堆顶元素 {} 出堆后", flag * val);
    print_util::print_heap(heap.iter().map(|&val| flag * val).collect());
}

/* Driver Code */
fn main() {
    /* 初始化堆 */
    // 初始化小顶堆
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust 的 BinaryHeap 是大顶堆，当入队时将元素值乘以 -1 将其反转，当出队时将元素值乘以 -1 将其还原
    let min_heap_flag = -1;
    // 初始化大顶堆
    let mut max_heap = BinaryHeap::new();
    let max_heap_flag = 1;

    println!("\n以下测试样例为大顶堆");

    /* 元素入堆 */
    test_push(&mut max_heap, 1, max_heap_flag);
    test_push(&mut max_heap, 3, max_heap_flag);
    test_push(&mut max_heap, 2, max_heap_flag);
    test_push(&mut max_heap, 5, max_heap_flag);
    test_push(&mut max_heap, 4, max_heap_flag);

    /* 获取堆顶元素 */
    let peek = max_heap.peek().unwrap() * max_heap_flag;
    println!("\n堆顶元素为 {}", peek);

    /* 堆顶元素出堆 */
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);

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
            .map(|val| min_heap_flag * val)
            .collect::<Vec<i32>>(),
    );
    println!("\n输入列表并建立小顶堆后");
    print_util::print_heap(min_heap.iter().map(|&val| min_heap_flag * val).collect());
}

/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

use std::collections::BinaryHeap;

fn test_push(heap: &mut BinaryHeap<i32>, val: i32, flag: i32) {
    heap.push(flag * val); // 元素入堆積
    println!("\n元素 {} 入堆積後", val);
    print_util::print_heap(heap.iter().map(|&val| flag * val).collect());
}

fn test_pop(heap: &mut BinaryHeap<i32>, flag: i32) {
    let val = heap.pop().unwrap();
    println!("\n堆積頂元素 {} 出堆積後", flag * val);
    print_util::print_heap(heap.iter().map(|&val| flag * val).collect());
}

/* Driver Code */
fn main() {
    /* 初始化堆積 */
    // 初始化小頂堆積
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust 的 BinaryHeap 是大頂堆積，當入列時將元素值乘以 -1 將其反轉，當出列時將元素值乘以 -1 將其還原
    let min_heap_flag = -1;
    // 初始化大頂堆積
    let mut max_heap = BinaryHeap::new();
    let max_heap_flag = 1;

    println!("\n以下測試樣例為大頂堆積");

    /* 元素入堆積 */
    test_push(&mut max_heap, 1, max_heap_flag);
    test_push(&mut max_heap, 3, max_heap_flag);
    test_push(&mut max_heap, 2, max_heap_flag);
    test_push(&mut max_heap, 5, max_heap_flag);
    test_push(&mut max_heap, 4, max_heap_flag);

    /* 獲取堆積頂元素 */
    let peek = max_heap.peek().unwrap() * max_heap_flag;
    println!("\n堆積頂元素為 {}", peek);

    /* 堆積頂元素出堆積 */
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);
    test_pop(&mut max_heap, max_heap_flag);

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
            .map(|val| min_heap_flag * val)
            .collect::<Vec<i32>>(),
    );
    println!("\n輸入串列並建立小頂堆積後");
    print_util::print_heap(min_heap.iter().map(|&val| min_heap_flag * val).collect());
}

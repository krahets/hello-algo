/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

// [region]{import}
use std::{cmp::Reverse, collections::BinaryHeap};
// [endregion]{import}

/* Driver Code */
fn main() {
    // [region]{init}
    /* 初始化堆積 */
    // 初始化小頂堆積
    // Rust 的 BinaryHeap 是大頂堆積，小頂堆積需用 Reverse 包裝元素
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // 初始化大頂堆積
    let mut max_heap = BinaryHeap::new();
    // [endregion]{init}

    println!("\n以下測試樣例為大頂堆積");

    // [region]{push}
    /* 元素入堆積 */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);
    // [endregion]{push}
    print_util::print_heap(max_heap.iter().map(|&val| val).collect());

    // [region]{peek}
    /* 獲取堆積頂元素 */
    let peek = max_heap.peek().unwrap(); // 5
    // [endregion]{peek}
    println!("\n堆積頂元素為 {}", peek);

    // [region]{pop_1}
    /* 堆積頂元素出堆積 */
    // 出堆積元素會形成一個從大到小的序列
    let peek = max_heap.pop().unwrap(); // 5
    // [endregion]{pop_1}
    println!("出堆積元素為 {}", peek);
    // [region]{pop_2}
    let peek = max_heap.pop().unwrap(); // 4
    // [endregion]{pop_2}
    println!("出堆積元素為 {}", peek);
    // [region]{pop_3}
    let peek = max_heap.pop().unwrap(); // 3
    // [endregion]{pop_3}
    println!("出堆積元素為 {}", peek);
    // [region]{pop_4}
    let peek = max_heap.pop().unwrap(); // 2
    // [endregion]{pop_4}
    println!("出堆積元素為 {}", peek);
    // [region]{pop_5}
    let peek = max_heap.pop().unwrap(); // 1
    // [endregion]{pop_5}
    println!("出堆積元素為 {}", peek);

    // [region]{size}
    /* 獲取堆積大小 */
    let size = max_heap.len();
    // [endregion]{size}
    println!("\n堆積元素數量為 {}", size);

    // [region]{is_empty}
    /* 判斷堆積是否為空 */
    let is_empty = max_heap.is_empty();
    // [endregion]{is_empty}
    println!("\n堆積是否為空 {}", is_empty);

    // [region]{heapify}
    /* 輸入串列並建堆積 */
    // 時間複雜度為 O(n) ，而非 O(nlogn)
    min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
    // [endregion]{heapify}
    println!("\n輸入串列並建立小頂堆積後");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

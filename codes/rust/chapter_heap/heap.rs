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
    /* 初始化堆 */
    // 初始化小顶堆
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust 的 BinaryHeap 是大顶堆，小顶堆一般会“套上”Reverse
    // 初始化大顶堆
    let mut max_heap = BinaryHeap::new();
    // [endregion]{init}

    println!("\n以下测试样例为大顶堆");

    // [region]{push}
    /* 元素入堆 */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);
    // [endregion]{push}
    print_util::print_heap(max_heap.iter().map(|&val| val).collect());

    // [region]{peek}
    /* 获取堆顶元素 */
    let peek = max_heap.peek().unwrap(); // 5
    // [endregion]{peek}
    println!("\n堆顶元素为 {}", peek);

    // [region]{pop_1}
    /* 堆顶元素出堆 */
    // 出堆元素会形成一个从大到小的序列
    let peek = max_heap.pop().unwrap(); // 5
    // [endregion]{pop_1}
    println!("{}", peek);
    // [region]{pop_2}
    let peek = max_heap.pop().unwrap(); // 4
    // [endregion]{pop_2}
    println!("{}", peek);
    // [region]{pop_3}
    let peek = max_heap.pop().unwrap(); // 3
    // [endregion]{pop_3}
    println!("{}", peek);
    // [region]{pop_4}
    let peek = max_heap.pop().unwrap(); // 2
    // [endregion]{pop_4}
    println!("{}", peek);
    // [region]{pop_5}
    let peek = max_heap.pop().unwrap(); // 1
    // [endregion]{pop_5}
    println!("{}", peek);

    // [region]{size}
    /* 获取堆大小 */
    let size = max_heap.len();
    // [endregion]{size}
    println!("\n堆元素数量为 {}", size);

    // [region]{is_empty}
    /* 判断堆是否为空 */
    let is_empty = max_heap.is_empty();
    // [endregion]{is_empty}
    println!("\n堆是否为空 {}", is_empty);

    // [region]{heapify}
    /* 输入列表并建堆 */
    // 时间复杂度为 O(n) ，而非 O(nlogn)
    min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
    // [endregion]{heapify}
    println!("\n输入列表并建立小顶堆后");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

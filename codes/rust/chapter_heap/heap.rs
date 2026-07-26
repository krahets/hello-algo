/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::heap::Heap;
use std::cmp::Reverse;
use std::collections::BinaryHeap;

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // 元素入堆
    println!("元素 {val} 入堆后");
    println!("堆的数组表示：{}", heap.display_as_array());
    println!("堆的树状表示：\n{}", heap.display_as_tree());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("堆顶元素 {val} 出堆后");
    println!("堆的数组表示：{}", heap.display_as_array());
    println!("堆的树状表示：\n{}", heap.display_as_tree());
}

/* Driver Code */
#[allow(unused_assignments)]
fn main() {
    /* 初始化堆 */
    // 初始化小顶堆
    let mut min_heap = BinaryHeap::new();
    // Rust 的 BinaryHeap 是大顶堆，小顶堆一般会“套上”Reverse
    // 初始化大顶堆
    let mut max_heap = BinaryHeap::new();

    println!("以下测试样例为大顶堆");

    /* 元素入堆 */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* 获取堆顶元素 */
    let peek = max_heap.peek().unwrap();
    println!("堆顶元素为 {peek}");

    /* 堆顶元素出堆 */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* 获取堆大小 */
    let size = max_heap.len();
    println!("堆元素数量为 {size}");

    /* 判断堆是否为空 */
    let is_empty = max_heap.is_empty();
    println!("堆是否为空 {is_empty}");

    /* 输入列表并建堆 */
    // 时间复杂度为 O(n) ，而非 O(nlogn)
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(Reverse)
            .collect::<Vec<_>>(),
    );

    let vec = min_heap.iter().map(|val| val.0).collect::<Vec<_>>();
    println!("输入列表并建立小顶堆后");
    println!("堆的数组表示：{}", vec.display_as_array());
    println!("堆的树状表示：\n{}", vec.display_as_tree());
}

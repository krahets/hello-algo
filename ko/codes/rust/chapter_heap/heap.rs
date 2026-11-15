/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::{cmp::Reverse, collections::BinaryHeap};

fn test_push_max(heap: &mut BinaryHeap<i32>, val: i32) {
    heap.push(val); // 힙에 원소 삽입
    println!("\n원소 {} 삽입 후의 힙", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

fn test_pop_max(heap: &mut BinaryHeap<i32>) {
    let val = heap.pop().unwrap();
    println!("\n루트 원소 {} 삭제 후의 힙", val);
    print_util::print_heap(heap.iter().map(|&val| val).collect());
}

/* 실행 코드 */
fn main() {
    /* 힙 초기화 */
    // 최소 힙 초기화
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust의 BinaryHeap은 최대 힙이며, 최소 힙을 만들 때는 보통 Reverse로 감싼다
    // 최대 힙 초기화
    let mut max_heap = BinaryHeap::new();

    println!("\n다음 테스트 예제는 최대 힙이다");

    /* 힙에 원소 삽입 */
    test_push_max(&mut max_heap, 1);
    test_push_max(&mut max_heap, 3);
    test_push_max(&mut max_heap, 2);
    test_push_max(&mut max_heap, 5);
    test_push_max(&mut max_heap, 4);

    /* 힙의 루트 원소 반환 */
    let peek = max_heap.peek().unwrap();
    println!("\n힙의 루트 원소: {}", peek);

    /* 힙의 루트 원소 꺼내기 */
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);
    test_pop_max(&mut max_heap);

    /* 힙 크기 반환 */
    let size = max_heap.len();
    println!("\n힙의 원소 개수: {}", size);

    /* 힙이 비어 있는지 판단 */
    let is_empty = max_heap.is_empty();
    println!("\n힙이 비어 있는가: {}", is_empty);

    /* 리스트를 입력하여 힙 구성 */
    // 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
    min_heap = BinaryHeap::from(
        vec![1, 3, 2, 5, 4]
            .into_iter()
            .map(|val| Reverse(val))
            .collect::<Vec<Reverse<i32>>>(),
    );
    println!("\n리스트를 입력하여 최소 힙을 구성한 후");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

// [region]{import}
use std::{cmp::Reverse, collections::BinaryHeap};
// [endregion]{import}

/* 실행 코드 */
fn main() {
    // [region]{init}
    /* 힙 초기화 */
    // 최소 힙 초기화
    // Rust의 BinaryHeap은 최대 힙이며, 최소 힙을 만들려면 원소를 Reverse로 감싸야 한다
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // 최대 힙 초기화
    let mut max_heap = BinaryHeap::new();
    // [endregion]{init}

    println!("\n다음 테스트 예제는 최대 힙이다");

    // [region]{push}
    /* 힙에 원소 삽입 */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);
    // [endregion]{push}
    print_util::print_heap(max_heap.iter().map(|&val| val).collect());

    // [region]{peek}
    /* 힙의 루트 원소 반환 */
    let peek = max_heap.peek().unwrap(); // 5
    // [endregion]{peek}
    println!("\n힙의 루트 원소: {}", peek);

    // [region]{pop_1}
    /* 힙의 루트 원소 꺼내기 */
    // 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
    let peek = max_heap.pop().unwrap(); // 5
    // [endregion]{pop_1}
    println!("힙에서 꺼낸 원소: {}", peek);
    // [region]{pop_2}
    let peek = max_heap.pop().unwrap(); // 4
    // [endregion]{pop_2}
    println!("힙에서 꺼낸 원소: {}", peek);
    // [region]{pop_3}
    let peek = max_heap.pop().unwrap(); // 3
    // [endregion]{pop_3}
    println!("힙에서 꺼낸 원소: {}", peek);
    // [region]{pop_4}
    let peek = max_heap.pop().unwrap(); // 2
    // [endregion]{pop_4}
    println!("힙에서 꺼낸 원소: {}", peek);
    // [region]{pop_5}
    let peek = max_heap.pop().unwrap(); // 1
    // [endregion]{pop_5}
    println!("힙에서 꺼낸 원소: {}", peek);

    // [region]{size}
    /* 힙 크기 반환 */
    let size = max_heap.len();
    // [endregion]{size}
    println!("\n힙의 원소 개수: {}", size);

    // [region]{is_empty}
    /* 힙이 비어 있는지 판단 */
    let is_empty = max_heap.is_empty();
    // [endregion]{is_empty}
    println!("\n힙이 비어 있는가: {}", is_empty);

    // [region]{heapify}
    /* 리스트를 입력하여 힙 구성 */
    // 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
    min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
    // [endregion]{heapify}
    println!("\n리스트를 입력하여 최소 힙을 구성한 후");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}

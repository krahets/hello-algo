/*
 * File: top_k.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

use std::cmp::Reverse;
use std::collections::BinaryHeap;

/* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
fn top_k_heap(nums: Vec<i32>, k: usize) -> BinaryHeap<Reverse<i32>> {
    // BinaryHeap은 최대 힙이므로 Reverse로 원소의 순서를 뒤집어 최소 힙을 구현한다
    let mut heap = BinaryHeap::<Reverse<i32>>::new();
    // 배열의 앞쪽 k개 원소를 힙에 삽입한다
    for &num in nums.iter().take(k) {
        heap.push(Reverse(num));
    }
    // k+1번째 원소부터 힙의 길이를 k로 유지한다
    for &num in nums.iter().skip(k) {
        // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
        if num > heap.peek().unwrap().0 {
            heap.pop();
            heap.push(Reverse(num));
        }
    }
    heap
}

/* 실행 코드 */
fn main() {
    let nums = vec![1, 7, 6, 3, 2];
    let k = 3;

    let res = top_k_heap(nums, k);
    println!("가장 큰 원소 {}개는 다음과 같다", k);
    print_util::print_heap(res.into_iter().map(|item| item.0).collect());
}

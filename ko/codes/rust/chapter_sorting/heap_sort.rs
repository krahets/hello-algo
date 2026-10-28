/*
 * File: heap_sort.rs
 * Created Time: 2023-07-04
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 길이가 n인 힙에서 노드 i부터 위에서 아래로 힙 재정렬 */
fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
    loop {
        // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
        let l = 2 * i + 1;
        let r = 2 * i + 2;
        let mut ma = i;
        if l < n && nums[l] > nums[ma] {
            ma = l;
        }
        if r < n && nums[r] > nums[ma] {
            ma = r;
        }
        // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
        if ma == i {
            break;
        }
        // 두 노드를 교환한다
        nums.swap(i, ma);
        // 아래쪽으로 힙 재정렬을 반복한다
        i = ma;
    }
}

/* 힙 정렬 */
fn heap_sort(nums: &mut [i32]) {
    // 힙 구성 연산: 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
    for i in (0..nums.len() / 2).rev() {
        sift_down(nums, nums.len(), i);
    }
    // 힙에서 최댓값을 꺼내는 작업을 n-1회 반복한다
    for i in (1..nums.len()).rev() {
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        nums.swap(0, i);
        // 루트 노드에서 시작하여 위에서 아래로 힙을 재정렬한다
        sift_down(nums, i, 0);
    }
}

/* 실행 코드 */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    heap_sort(&mut nums);
    print!("힙 정렬을 마친 후 nums = ");
    print_util::print_array(&nums);
}

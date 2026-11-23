/*
 * File: binary_search_insertion.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */
#![allow(unused)]

/* 삽입 위치의 이진 탐색(중복 원소 없음) */
fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 닫힌 구간 [0, n-1]을 초기화한다
    while i <= j {
        let m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
        if nums[m as usize] < target {
            i = m + 1; // target은 구간 [m+1, j]에 있다
        } else if nums[m as usize] > target {
            j = m - 1; // target은 구간 [i, m-1]에 있다
        } else {
            return m;
        }
    }
    // target을 찾지 못했으므로 삽입 위치 i를 반환한다
    i
}

/* 삽입 위치의 이진 탐색(중복 원소 있음) */
pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 닫힌 구간 [0, n-1]을 초기화한다
    while i <= j {
        let m = i + (j - i) / 2; // 중간 인덱스 m을 계산한다
        if nums[m as usize] < target {
            i = m + 1; // target은 구간 [m+1, j]에 있다
        } else if nums[m as usize] > target {
            j = m - 1; // target은 구간 [i, m-1]에 있다
        } else {
            j = m - 1; // target보다 작은 가장 오른쪽 원소는 구간 [i, m-1]에 있다
        }
    }
    // 삽입 위치 i를 반환한다
    i
}

/* 실행 코드 */
fn main() {
    // 중복 원소가 없는 배열
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    println!("\n배열 nums = {:?}", nums);
    // 삽입 위치의 이진 탐색
    for target in [6, 9] {
        let index = binary_search_insertion_simple(&nums, target);
        println!("원소 {}의 삽입 위치 인덱스: {}", target, index);
    }

    // 중복 원소를 포함하는 배열
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n배열 nums = {:?}", nums);
    // 삽입 위치의 이진 탐색
    for target in [2, 6, 20] {
        let index = binary_search_insertion(&nums, target);
        println!("원소 {}의 삽입 위치 인덱스: {}", target, index);
    }
}

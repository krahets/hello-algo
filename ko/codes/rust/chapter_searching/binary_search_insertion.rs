/*
 * File: binary_search_insertion.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */
#![allow(unused)]

/* 이진 탐색으로 삽입 위치 찾기(중복 원소가 없는 경우) */
fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 닫힌구간 [0, n-1]을 초기화한다.
    while i <= j {
        let m = i + (j - i) / 2; // 중점 인덱스 m을 계산한다.
        if nums[m as usize] < target {
            i = m + 1; // target을 찾을 구간은 [m+1, j]이다.
        } else if nums[m as usize] > target {
            j = m - 1; // target을 찾을 구간은 [i, m-1]이다.
        } else {
            return m;
        }
    }
    // target을 찾지 못했으므로 삽입 위치 i를 반환한다.
    i
}

/* 이진 탐색으로 삽입 위치 찾기(중복 원소가 있는 경우) */
pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 닫힌구간 [0, n-1]을 초기화한다.
    while i <= j {
        let m = i + (j - i) / 2; // 중점 인덱스 m을 계산한다.
        if nums[m as usize] < target {
            i = m + 1; // target을 찾을 구간은 [m+1, j]이다.
        } else if nums[m as usize] > target {
            j = m - 1; // target을 찾을 구간은 [i, m-1]이다.
        } else {
            j = m - 1; // target보다 작은 원소 중 가장 오른쪽 원소를 찾을 구간은 [i, m-1]이다.
        }
    }
    // 삽입 위치 i를 반환한다.
    i
}

/* 실행 예제 */
fn main() {
    // 중복 원소가 없는 배열
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    println!("\n배열 nums = {:?}", nums);
    // 이진 탐색으로 삽입 위치 찾기
    for target in [6, 9] {
        let index = binary_search_insertion_simple(&nums, target);
        println!("삽입할 값 = {} | 삽입 인덱스 = {}", target, index);
    }

    // 중복 원소가 있는 배열
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n배열 nums = {:?}", nums);
    // 이진 탐색으로 삽입 위치 찾기
    for target in [2, 6, 20] {
        let index = binary_search_insertion(&nums, target);
        println!("삽입할 값 = {} | 삽입 인덱스 = {}", target, index);
    }
}

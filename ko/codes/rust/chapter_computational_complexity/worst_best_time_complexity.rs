/*
 * File: worst_best_time_complexity.rs
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::seq::SliceRandom;
use rand::thread_rng;

/* 원소가 { 1, 2, ..., n }이며 순서가 섞인 배열 생성 */
fn random_numbers(n: i32) -> Vec<i32> {
    // 배열 nums = { 1, 2, 3, ..., n }을 생성한다
    let mut nums = (1..=n).collect::<Vec<i32>>();
    // 배열 원소를 무작위로 섞는다
    nums.shuffle(&mut thread_rng());
    nums
}

/* 배열 nums에서 숫자 1이 있는 인덱스 탐색 */
fn find_one(nums: &[i32]) -> Option<usize> {
    for i in 0..nums.len() {
        // 원소 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)에 도달한다
        // 원소 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)에 도달한다
        if nums[i] == 1 {
            return Some(i);
        }
    }
    None
}

/* 실행 코드 */
fn main() {
    for _ in 0..10 {
        let n = 100;
        let nums = random_numbers(n);
        let index = find_one(&nums).unwrap();
        print!("\n배열 [ 1, 2, ..., n ]을 섞은 결과 = ");
        print_util::print_array(&nums);
        println!("\n숫자 1의 인덱스: {}", index);
    }
}

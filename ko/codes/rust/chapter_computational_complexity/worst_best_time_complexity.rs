/*
 * File: worst_best_time_complexity.rs
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::seq::SliceRandom;
use rand::thread_rng;

/* { 1, 2, ..., n }을 원소로 갖는 배열을 만들고 순서를 섞는다 */
fn random_numbers(n: i32) -> Vec<i32> {
    // 배열 nums = { 1, 2, 3, ..., n }을 만든다
    let mut nums = (1..=n).collect::<Vec<i32>>();
    // 배열의 원소를 무작위로 섞는다
    nums.shuffle(&mut thread_rng());
    nums
}

/* 배열 nums에서 1의 인덱스를 찾는다 */
fn find_one(nums: &[i32]) -> Option<usize> {
    for i in 0..nums.len() {
        // 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)이 된다
        // 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)이 된다
        if nums[i] == 1 {
            return Some(i);
        }
    }
    None
}

/* 실행 예제 */
fn main() {
    for _ in 0..10 {
        let n = 100;
        let nums = random_numbers(n);
        let index = find_one(&nums).unwrap();
        print!("\n배열 [ 1, 2, ..., n ]을 섞은 결과 = ");
        print_util::print_array(&nums);
        println!("\n숫자 1의 인덱스 = {}", index);
    }
}

/*
 * File: worst_best_time_complexity.rs
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::seq::SliceRandom;
use rand::thread_rng;

/* 建立含有 { 1, 2, ..., n } 的陣列，並打亂順序 */
fn random_numbers(n: i32) -> Vec<i32> {
    // 建立陣列 nums = { 1, 2, 3, ..., n }
    let mut nums = (1..=n).collect::<Vec<i32>>();
    // 隨機打亂陣列元素
    nums.shuffle(&mut thread_rng());
    nums
}

/* 在陣列 nums 中尋找數字 1 的索引 */
fn find_one(nums: &[i32]) -> Option<usize> {
    for i in 0..nums.len() {
        // 若 1 在陣列開頭，最佳時間複雜度為 O(1)
        // 若 1 在陣列末端，最差時間複雜度為 O(n)
        if nums[i] == 1 {
            return Some(i);
        }
    }
    None
}

/* 主程式 */
fn main() {
    for _ in 0..10 {
        let n = 100;
        let nums = random_numbers(n);
        let index = find_one(&nums).unwrap();
        print!("\n陣列 [ 1, 2, ..., n ] 打亂順序後 = ");
        print_util::print_array(&nums);
        println!("\n數字 1 的索引為 {}", index);
    }
}

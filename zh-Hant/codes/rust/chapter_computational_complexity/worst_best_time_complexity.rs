/*
 * File: worst_best_time_complexity.rs
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use rand::seq::SliceRandom;
use rand::thread_rng;

/* 生成一個陣列，元素為 { 1, 2, ..., n }，順序被打亂 */
fn random_numbers(n: i32) -> Vec<i32> {
    // 生成陣列 nums = { 1, 2, 3, ..., n }
    let mut nums = (1..=n).collect::<Vec<i32>>();
    // 隨機打亂陣列元素
    nums.shuffle(&mut thread_rng());
    nums
}

/* 查詢陣列 nums 中數字 1 所在索引 */
fn find_one(nums: &[i32]) -> Option<usize> {
    for i in 0..nums.len() {
        // 當元素 1 在陣列頭部時，達到最佳時間複雜度 O(1)
        // 當元素 1 在陣列尾部時，達到最差時間複雜度 O(n)
        if nums[i] == 1 {
            return Some(i);
        }
    }
    None
}

/* Driver Code */
fn main() {
    for _ in 0..10 {
        let n = 100;
        let nums = random_numbers(n);
        let index = find_one(&nums).unwrap();
        print!("\n陣列 [ 1, 2, ..., n ] 被打亂後 = ");
        print_util::print_array(&nums);
        println!("\n數字 1 的索引為 {}", index);
    }
}

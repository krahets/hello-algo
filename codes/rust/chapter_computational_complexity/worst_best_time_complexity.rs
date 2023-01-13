//   rand = "0.8.5"
/**
 * File: time_complexity.cpp
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com )
 */

// to compilse and run this singile file need:
// 1. cargo install cargo-single
// 2. cargo single run worst_best_time_complexity.rs

use rand::seq::SliceRandom;
use rand::thread_rng;

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
fn random_numbers(n: i32) -> Vec<i32> {
    // 生成数组 nums = { 1, 2, 3, ..., n }
    let mut nums = (1..n + 1).collect::<Vec<i32>>();
    // 随机打乱数组元素
    nums.shuffle(&mut thread_rng());
    nums
}

/* 查找数组 nums 中数字 1 所在索引 */
fn find_one(nums: &[i32]) -> Option<usize> {
    for i in 0..nums.len() {
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
        let index = find_one(&nums);
        println!("\n数组 [ 1, 2, ..., n ] 被打乱后 = {:?}", nums);
        println!("数字 1 的索引为 {:?}", index);
    }
}
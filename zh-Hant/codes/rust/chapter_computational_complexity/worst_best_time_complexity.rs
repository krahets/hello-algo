/*
 * File: worst_best_time_complexity.rs
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use rand::seq::SliceRandom;
use rand::thread_rng;

/* 生成一个数组，元素为 { 1, 2, ..., n }，顺序被打乱 */
fn random_numbers(n: i32) -> Vec<i32> {
    // 生成数组 nums = { 1, 2, 3, ..., n }
    let mut nums = (1..=n).collect::<Vec<i32>>();
    // 随机打乱数组元素
    nums.shuffle(&mut thread_rng());
    nums
}

/* 查找数组 nums 中数字 1 所在索引 */
fn find_one(nums: &[i32]) -> Option<usize> {
    for i in 0..nums.len() {
        // 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
        // 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
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
        print!("\n数组 [ 1, 2, ..., n ] 被打乱后 = ");
        print_util::print_array(&nums);
        println!("\n数字 1 的索引为 {}", index);
    }
}

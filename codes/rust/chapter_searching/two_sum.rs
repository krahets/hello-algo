/*
 * File: two_sum.rs
 * Created Time: 2023-01-14
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use std::collections::HashMap;

/* 方法一：暴力枚举 */
pub fn two_sum_brute_force(nums: &[i32], target: i32) -> Option<[usize; 2]> {
    let size = nums.len();
    // 两层循环，时间复杂度为 O(n^2)
    for i in 0..(size - 1) {
        for j in (i + 1)..size {
            if nums[i] + nums[j] == target {
                return Some([i, j]);
            }
        }
    }
    None
}

/* 方法二：辅助哈希表 */
pub fn two_sum_hash_table(nums: &[i32], target: i32) -> Option<[usize; 2]> {
    // 辅助哈希表，空间复杂度为 O(n)
    let mut dic = HashMap::new();
    // 单层循环，时间复杂度为 O(n)
    for (i, num) in nums.iter().enumerate() {
        if let Some(&j) = dic.get(&(target - num)) {
            // j 在前以确保增序输出
            return Some([j, i]);
        }
        dic.insert(num, i);
    }
    None
}

/* Driver Code */
fn main() {
    let nums = vec![2, 7, 11, 15];
    let target = 13;

    // 方法一
    let res = two_sum_brute_force(&nums, target).unwrap();
    println!("方法一 res = {res:?}");
    // 方法二
    let res = two_sum_hash_table(&nums, target).unwrap();
    println!("方法二 res = {res:?}");
}

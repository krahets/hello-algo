/*
 * File: two_sum.rs
 * Created Time: 2023-01-14
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::HashMap;

/* 方法一：暴力枚举 */
pub fn two_sum_brute_force(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
    let size = nums.len();
    // 两层循环，时间复杂度为 O(n^2)
    for i in 0..size - 1 {
        for j in i + 1..size {
            if nums[i] + nums[j] == target {
                return Some(vec![i as i32, j as i32]);
            }
        }
    }
    None
}

/* 方法二：辅助哈希表 */
pub fn two_sum_hash_table(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
    // 辅助哈希表，空间复杂度为 O(n)
    let mut dic = HashMap::new();
    // 单层循环，时间复杂度为 O(n)
    for (i, num) in nums.iter().enumerate() {
        match dic.get(&(target - num)) {
            Some(v) => return Some(vec![*v as i32, i as i32]),
            None => dic.insert(num, i as i32),
        };
    }
    None
}

fn main() {
    // ======= Test Case =======
    let nums = vec![2, 7, 11, 15];
    let target = 13;

    // ====== Driver Code ======
    // 方法一
    let res = two_sum_brute_force(&nums, target).unwrap();
    print!("方法一 res = ");
    print_util::print_array(&res);
    // 方法二
    let res = two_sum_hash_table(&nums, target).unwrap();
    print!("\n方法二 res = ");
    print_util::print_array(&res);
}

// File: leetcode_two_sum.rs
// Created Time: 2023-01-14
// Author: xBLACICEx (xBLACKICEx@outlook.com), sjinzh (sjinzh@gmail.com)

include!("../include/include.rs");

use std::collections::HashMap;
struct SolutionBruteForce;
struct SolutionHashMap;

// 方法一：暴力枚举
impl SolutionBruteForce {
    pub fn two_sum(nums: &Vec<i32>, target: i32) -> Vec<i32> {
        let size = nums.len();
        // 两层循环，时间复杂度 O(n^2)
        for i in 0..size - 1 {
            for j in i + 1..size {
                if nums[i] + nums[j] == target {
                    return vec![i as i32, j as i32];
                }
            }
        }
        vec![]
    }
}

// 方法二：辅助哈希表
impl SolutionHashMap {
    pub fn two_sum(nums: &Vec<i32>, target: i32) -> Vec<i32> {
        // 辅助哈希表，空间复杂度 O(n)
        let mut dic = HashMap::new();
        // 单层循环，时间复杂度 O(n)
        for (i, num) in nums.iter().enumerate() {
            match dic.get(&(target - num)) {
                Some(v) => return vec![*v as i32, i as i32],
                None => dic.insert(num, i as i32)
            };
        }
        vec![]
    }
}

// Driver Code
fn main() {
    // ======= Test Case =======
    let nums = vec![ 2, 7, 11, 15 ];
    let target = 9;

    // 方法一
    let res = SolutionBruteForce::two_sum(&nums, target);
    print!("方法一 res = ");
    print_util::print_array(&res);
    // 方法二
    let res = SolutionHashMap::two_sum(&nums, target);
    print!("\n方法二 res = ");
    print_util::print_array(&res);
}
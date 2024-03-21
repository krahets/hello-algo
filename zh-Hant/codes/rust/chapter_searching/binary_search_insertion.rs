/*
 * File: binary_search_insertion.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */
#![allow(unused)]

/* 二分查找插入点（无重复元素） */
fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 初始化双闭区间 [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // 计算中点索引 m
        if nums[m as usize] < target {
            i = m + 1; // target 在区间 [m+1, j] 中
        } else if nums[m as usize] > target {
            j = m - 1; // target 在区间 [i, m-1] 中
        } else {
            return m;
        }
    }
    // 未找到 target ，返回插入点 i
    i
}

/* 二分查找插入点（存在重复元素） */
pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 初始化双闭区间 [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // 计算中点索引 m
        if nums[m as usize] < target {
            i = m + 1; // target 在区间 [m+1, j] 中
        } else if nums[m as usize] > target {
            j = m - 1; // target 在区间 [i, m-1] 中
        } else {
            j = m - 1; // 首个小于 target 的元素在区间 [i, m-1] 中
        }
    }
    // 返回插入点 i
    i
}

/* Driver Code */
fn main() {
    // 无重复元素的数组
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    println!("\n数组 nums = {:?}", nums);
    // 二分查找插入点
    for target in [6, 9] {
        let index = binary_search_insertion_simple(&nums, target);
        println!("元素 {} 的插入点的索引为 {}", target, index);
    }

    // 包含重复元素的数组
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n数组 nums = {:?}", nums);
    // 二分查找插入点
    for target in [2, 6, 20] {
        let index = binary_search_insertion(&nums, target);
        println!("元素 {} 的插入点的索引为 {}", target, index);
    }
}

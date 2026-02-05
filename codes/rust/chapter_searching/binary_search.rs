/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use std::cmp::Ordering;

/* 二分查找（双闭区间） */
pub fn binary_search(nums: &[i32], target: i32) -> Option<usize> {
    // 数组为空时，返回 None
    if nums.is_empty() {
        return None;
    }
    // 初始化双闭区间 [0, n-1] ，即 i, j 分别指向数组首元素、尾元素
    let mut i = 0;
    // 数组不为空，不会发生减法溢出
    let mut j = nums.len() - 1;
    // 循环，当搜索区间为空时跳出（当 i > j 时为空）
    while i <= j {
        // 计算中点索引 m
        let m = i + (j - i) / 2;
        match target.cmp(&nums[m]) {
            // target 在区间 [i, m - 1] 中
            // 如果 m.checked_sub(1) 返回 None，说明 m == 0，
            // 所以 target < nums[0]，未找到目标元素，返回 None
            Ordering::Less => j = m.checked_sub(1)?,
            // target 在区间 [m + 1, j] 中
            Ordering::Greater => i = m + 1,
            // 找到目标元素，返回其索引
            Ordering::Equal => return Some(m),
        }
    }
    // 未找到目标元素，返回 None
    None
}

/* 二分查找（左闭右开区间） */
pub fn binary_search_lcro(nums: &[i32], target: i32) -> Option<usize> {
    // 初始化左闭右开区间 [0, n) ，即 i, j 分别指向数组首元素、尾元素 + 1
    let mut i = 0;
    let mut j = nums.len();
    // 循环，当搜索区间为空时跳出（当 i = j 时为空）
    while i < j {
        // 计算中点索引 m
        let m = i + (j - i) / 2;
        match target.cmp(&nums[m]) {
            // target 在区间 [i, m) 中
            Ordering::Less => j = m,
            // target 在区间 [m + 1, j) 中
            Ordering::Greater => i = m + 1,
            // 找到目标元素，返回其索引
            Ordering::Equal => return Some(m),
        }
    }
    // 未找到目标元素，返回 None
    None
}

/* Driver Code */
fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 二分查找（双闭区间）
    let index = binary_search(&nums, target);
    println!("目标元素 6 的索引 = {index:?}");

    // 二分查找（左闭右开区间）
    let index = binary_search_lcro(&nums, target);
    println!("目标元素 6 的索引 = {index:?}");
}

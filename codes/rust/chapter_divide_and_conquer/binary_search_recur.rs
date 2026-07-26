/*
 * File: binary_search_recur.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::cmp::Ordering;

/* 二分查找：问题 f(i, j) */
fn dfs(nums: &[i32], target: i32, i: usize, j: usize) -> Option<usize> {
    // 若区间为空，代表无目标元素，则返回 None
    if i > j {
        return None;
    }
    let m = i + (j - i) / 2;
    match target.cmp(&nums[m]) {
        // 递归子问题 f(i, m - 1)
        // 如果 m.checked_sub(1) 返回 None，说明 m == 0，
        // 所以 target < nums[0]，未找到目标元素，返回 None
        Ordering::Less => dfs(nums, target, i, m.checked_sub(1)?),
        // 递归子问题 f(m + 1, j)
        Ordering::Greater => dfs(nums, target, m + 1, j),
        // 找到目标元素，返回其索引
        Ordering::Equal => Some(m),
    }
}

/* 二分查找 */
pub fn binary_search(nums: &[i32], target: i32) -> Option<usize> {
    if nums.is_empty() {
        return None;
    }
    let n = nums.len();
    // 求解问题 f(0, n - 1)
    dfs(nums, target, 0, n - 1)
}

/* Driver Code */
fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 二分查找（双闭区间）
    let index = binary_search(&nums, target);
    println!("目标元素 6 的索引 = {index:?}");
}

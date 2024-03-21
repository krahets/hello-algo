/*
 * File: binary_search_recur.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* 二分查找：问题 f(i, j) */
fn dfs(nums: &[i32], target: i32, i: i32, j: i32) -> i32 {
    // 若区间为空，代表无目标元素，则返回 -1
    if i > j {
        return -1;
    }
    let m: i32 = (i + j) / 2;
    if nums[m as usize] < target {
        // 递归子问题 f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if nums[m as usize] > target {
        // 递归子问题 f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // 找到目标元素，返回其索引
        return m;
    }
}

/* 二分查找 */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    let n = nums.len() as i32;
    // 求解问题 f(0, n-1)
    dfs(nums, target, 0, n - 1)
}

/* Driver Code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 二分查找（双闭区间）
    let index = binary_search(&nums, target);
    println!("目标元素 6 的索引 = {index}");
}

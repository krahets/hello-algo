/*
 * File: binary_search_recur.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* 二分搜尋：問題 f(i, j) */
fn dfs(nums: &[i32], target: i32, i: i32, j: i32) -> i32 {
    // 若區間為空，代表無目標元素，則返回 -1
    if i > j {
        return -1;
    }
    let m: i32 = i + (j - i) / 2;
    if nums[m as usize] < target {
        // 遞迴子問題 f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if nums[m as usize] > target {
        // 遞迴子問題 f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // 找到目標元素，返回其索引
        return m;
    }
}

/* 二分搜尋 */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    let n = nums.len() as i32;
    // 求解問題 f(0, n-1)
    dfs(nums, target, 0, n - 1)
}

/* Driver Code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 二分搜尋（雙閉區間）
    let index = binary_search(&nums, target);
    println!("目標元素 6 的索引 = {index}");
}

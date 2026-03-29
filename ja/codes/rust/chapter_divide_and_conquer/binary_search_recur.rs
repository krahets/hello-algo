/*
 * File: binary_search_recur.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* 二分探索：問題 f(i, j) */
fn dfs(nums: &[i32], target: i32, i: i32, j: i32) -> i32 {
    // 区間が空なら対象要素は存在しないので -1 を返す
    if i > j {
        return -1;
    }
    let m: i32 = i + (j - i) / 2;
    if nums[m as usize] < target {
        // 部分問題 f(m+1, j) を再帰的に解く
        return dfs(nums, target, m + 1, j);
    } else if nums[m as usize] > target {
        // 部分問題 f(i, m-1) を再帰的に解く
        return dfs(nums, target, i, m - 1);
    } else {
        // 目標要素が見つかったらそのインデックスを返す
        return m;
    }
}

/* 二分探索 */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    let n = nums.len() as i32;
    // 問題 f(0, n-1) を解く
    dfs(nums, target, 0, n - 1)
}

/* Driver Code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 二分探索（両閉区間）
    let index = binary_search(&nums, target);
    println!("目的の要素 6 のインデックス = {index}");
}

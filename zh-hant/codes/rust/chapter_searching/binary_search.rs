/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* 二分搜尋（雙閉區間） */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // 初始化雙閉區間 [0, n-1] ，即 i, j 分別指向陣列首元素、尾元素
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // 迴圈，當搜尋區間為空時跳出（當 i > j 時為空）
    while i <= j {
        let m = i + (j - i) / 2; // 計算中點索引 m
        if nums[m as usize] < target {
            // 此情況說明 target 在區間 [m+1, j] 中
            i = m + 1;
        } else if nums[m as usize] > target {
            // 此情況說明 target 在區間 [i, m-1] 中
            j = m - 1;
        } else {
            // 找到目標元素，返回其索引
            return m;
        }
    }
    // 未找到目標元素，返回 -1
    return -1;
}

/* 二分搜尋（左閉右開區間） */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // 初始化左閉右開區間 [0, n) ，即 i, j 分別指向陣列首元素、尾元素+1
    let mut i = 0;
    let mut j = nums.len() as i32;
    // 迴圈，當搜尋區間為空時跳出（當 i = j 時為空）
    while i < j {
        let m = i + (j - i) / 2; // 計算中點索引 m
        if nums[m as usize] < target {
            // 此情況說明 target 在區間 [m+1, j) 中
            i = m + 1;
        } else if nums[m as usize] > target {
            // 此情況說明 target 在區間 [i, m) 中
            j = m;
        } else {
            // 找到目標元素，返回其索引
            return m;
        }
    }
    // 未找到目標元素，返回 -1
    return -1;
}

/* Driver Code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 二分搜尋（雙閉區間）
    let mut index = binary_search(&nums, target);
    println!("目標元素 6 的索引 = {index}");

    // 二分搜尋（左閉右開區間）
    index = binary_search_lcro(&nums, target);
    println!("目標元素 6 的索引 = {index}");
}

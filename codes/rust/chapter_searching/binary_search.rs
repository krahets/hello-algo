/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* 二分查找（双闭区间） */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // 初始化双闭区间 [0, n-1] ，即 i, j 分别指向数组首元素、尾元素
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // 循环，当搜索区间为空时跳出（当 i > j 时为空）
    while i <= j {
        let m = i + (j - i) / 2; // 计算中点索引 m
        if nums[m as usize] < target {
            // 此情况说明 target 在区间 [m+1, j] 中
            i = m + 1;
        } else if nums[m as usize] > target {
            // 此情况说明 target 在区间 [i, m-1] 中
            j = m - 1;
        } else {
            // 找到目标元素，返回其索引
            return m;
        }
    }
    // 未找到目标元素，返回 -1
    return -1;
}

/* 二分查找（左闭右开区间） */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // 初始化左闭右开区间 [0, n) ，即 i, j 分别指向数组首元素、尾元素+1
    let mut i = 0;
    let mut j = nums.len() as i32;
    // 循环，当搜索区间为空时跳出（当 i = j 时为空）
    while i < j {
        let m = i + (j - i) / 2; // 计算中点索引 m
        if nums[m as usize] < target {
            // 此情况说明 target 在区间 [m+1, j) 中
            i = m + 1;
        } else if nums[m as usize] > target {
            // 此情况说明 target 在区间 [i, m) 中
            j = m;
        } else {
            // 找到目标元素，返回其索引
            return m;
        }
    }
    // 未找到目标元素，返回 -1
    return -1;
}

/* Driver Code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 二分查找（双闭区间）
    let mut index = binary_search(&nums, target);
    println!("目标元素 6 的索引 = {index}");

    // 二分查找（左闭右开区间）
    index = binary_search_lcro(&nums, target);
    println!("目标元素 6 的索引 = {index}");
}

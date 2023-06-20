/*
 * File: binary_search_edge.rs
 * Created Time: 2023-05-31
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* 二分查找最左一个元素 */
fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    let mut i = 0;
    let mut j = nums.len() as i32 - 1; // 初始化双闭区间 [0, n-1]
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
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1; // 未找到目标元素，返回 -1
    }
    i
}

/* 二分查找最右一个元素 */
fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    let mut i = 0;
    let mut j = nums.len() as i32 - 1; // 初始化双闭区间 [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // 计算中点索引 m
        if nums[m as usize] < target {
            i = m + 1; // target 在区间 [m+1, j] 中
        } else if nums[m as usize] > target {
            j = m - 1; // target 在区间 [i, m-1] 中
        } else {
            i = m + 1; // 首个大于 target 的元素在区间 [m+1, j] 中
        }
    }
    if j < 0 || nums[j as usize] != target {
        return -1; // 未找到目标元素，返回 -1
    }
    j
}

/* Driver Code */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];

    // 二分查找最左一个元素
    let index_left = binary_search_left_edge(&nums, target);
    println!("数组中最左一个元素 6 的索引 = {}", index_left);

    // 二分查找最右一个元素
    let index_right = binary_search_right_edge(&nums, target);
    println!("数组中最右一个元素 6 的索引 = {}", index_right);
}
/*
 * File: binary_search_insertion.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

use std::cmp::Ordering;

/* 二分查找插入点（无重复元素） */
pub fn binary_search_insertion_simple(nums: &[i32], target: i32) -> usize {
    // 数组为空时，返回索引位置 0 作为插入点
    if nums.is_empty() {
        return 0;
    }
    // 初始化双闭区间 [0, n - 1]
    let mut i = 0;
    // 数组不为空，不会发生减法溢出
    let mut j = nums.len() - 1;
    while i <= j {
        // 计算中点索引 m
        let m = i + (j - i) / 2;
        match target.cmp(&nums[m]) {
            // target 在区间 [i, m - 1] 中
            Ordering::Less => match m.checked_sub(1) {
                // 如果 m.checked_sub(1) 返回 None，说明 m == 0，
                // 所以 target < nums[0]，返回索引位置 0 作为插入点
                None => return 0,
                Some(v) => j = v,
            },
            // target 在区间 [m + 1, j] 中
            Ordering::Greater => i = m + 1,
            // target 在索引 m 处，返回插入点 m
            Ordering::Equal => return m,
        }
    }
    // 未找到 target ，返回插入点 i
    i
}

/* 二分查找插入点（存在重复元素） */
pub fn binary_search_insertion(nums: &[i32], target: i32) -> usize {
    // 数组为空时，返回索引位置 0 作为插入点
    if nums.is_empty() {
        return 0;
    }
    // 初始化双闭区间 [0, n - 1]
    let mut i = 0;
    // 数组不为空，不会发生减法溢出
    let mut j = nums.len() - 1;
    while i <= j {
        // 计算中点索引 m
        let m = i + (j - i) / 2;
        match target.cmp(&nums[m]) {
            // target 在区间 [i, m - 1] 中
            Ordering::Less => match m.checked_sub(1) {
                // 如果 m.checked_sub(1) 返回 None，说明 m == 0，
                // 所以 target < nums[0]，返回索引位置 0 作为插入点
                None => return 0,
                Some(v) => j = v,
            },
            // target 在区间 [m + 1, j] 中
            Ordering::Greater => i = m + 1,
            // 索引 m 处存在 target，继续向左查找索引最小的 target
            Ordering::Equal => match m.checked_sub(1) {
                // 如果 m.checked_sub(1) 返回 None，说明 m == 0，
                // 所以最左 target 在数组起点，返回索引位置 0 作为插入点
                None => return 0,
                Some(v) => j = v,
            },
        }
    }
    // 返回插入点 i
    i
}

/* Driver Code */
fn main() {
    // 无重复元素的数组
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    println!("数组 nums = {nums:?}");
    // 二分查找插入点
    for target in [6, 9] {
        let index = binary_search_insertion_simple(&nums, target);
        println!("元素 {target} 的插入点的索引为 {index}");
    }

    // 包含重复元素的数组
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("数组 nums = {nums:?}");
    // 二分查找插入点
    for target in [2, 6, 20] {
        let index = binary_search_insertion(&nums, target);
        println!("元素 {target} 的插入点的索引为 {index}");
    }
}

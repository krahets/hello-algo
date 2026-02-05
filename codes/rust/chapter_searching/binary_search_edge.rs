/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

use std::cmp::Ordering;

/* 二分查找最左一个 target */
pub fn binary_search_left_edge(nums: &[i32], target: i32) -> Option<usize> {
    // 等价于查找 target 的插入点
    let i = binary_search_insertion(nums, target);
    // 未找到 target ，返回 None
    if i == nums.len() || nums[i] != target {
        return None;
    }
    // 找到 target ，返回索引 i
    Some(i)
}

/* 二分查找最右一个 target */
pub fn binary_search_right_edge(nums: &[i32], target: i32) -> Option<usize> {
    // 转化为查找最左一个 target + 1
    let Some(next) = target.checked_add(1) else {
        return nums.len().checked_sub(1);
    };
    let i = binary_search_insertion(nums, next);
    // i 指向首个大于 target 的元素，如果 i == 0 ，说明数组中不存在 target
    if i == 0 {
        return None;
    }
    // j 指向最右一个 target
    let j = i - 1;
    // 未找到 target ，返回 None
    if nums[j] != target {
        return None;
    }
    // 找到 target ，返回索引 j
    Some(j)
}

// 在之前的代码里，这个函数导入自 binary_search_insertion.rs 文件。
// 然而，binary_search_insertion.rs 是一个 bin crate，不应被当作
// 模块使用，这是一种不良实践。为了方便起见，我们将该函数直接复制过来。
fn binary_search_insertion(nums: &[i32], target: i32) -> usize {
    if nums.is_empty() {
        return 0;
    }
    let mut i = 0;
    let mut j = nums.len() - 1;
    while i <= j {
        let m = i + (j - i) / 2;
        match target.cmp(&nums[m]) {
            Ordering::Less => match m.checked_sub(1) {
                None => return 0,
                Some(v) => j = v,
            },
            Ordering::Greater => i = m + 1,
            Ordering::Equal => match m.checked_sub(1) {
                None => return 0,
                Some(v) => j = v,
            },
        }
    }
    i
}

/* Driver Code */
fn main() {
    // 包含重复元素的数组
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("数组 nums = {nums:?}");

    // 二分查找左边界和右边界
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("最左一个元素 {target} 的索引为 {index:?}");
        let index = binary_search_right_edge(&nums, target);
        println!("最右一个元素 {target} 的索引为 {index:?}");
    }
}

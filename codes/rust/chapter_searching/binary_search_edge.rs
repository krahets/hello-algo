/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

mod binary_search_insertion;

use binary_search_insertion::binary_search_insertion;

/* 二分查找最左一个 target */
fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    // 等价于查找 target 的插入点
    let i = binary_search_insertion(nums, target);
    // 未找到 target ，返回 -1
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1;
    }
    // 找到 target ，返回索引 i
    i
}

/* 二分查找最右一个 target */
fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    // 转化为查找最左一个 target + 1
    let i = binary_search_insertion(nums, target + 1);
    // j 指向最右一个 target ，i 指向首个大于 target 的元素
    let j = i - 1;
    // 未找到 target ，返回 -1
    if j == -1 || nums[j as usize] != target {
        return -1;
    }
    // 找到 target ，返回索引 j
    j
}

/* Driver Code */
fn main() {
    // 包含重复元素的数组
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n数组 nums = {:?}", nums);

    // 二分查找左边界和右边界
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("最左一个元素 {} 的索引为 {}", target, index);
        let index = binary_search_right_edge(&nums, target);
        println!("最右一个元素 {} 的索引为 {}", target, index);
    }
}

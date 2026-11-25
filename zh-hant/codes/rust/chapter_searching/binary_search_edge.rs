/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

mod binary_search_insertion;

use binary_search_insertion::binary_search_insertion;

/* 用二分搜尋找最左邊的 target */
fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    // 等同於搜尋 target 的插入點
    let i = binary_search_insertion(nums, target);
    // 找不到 target，回傳 -1
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1;
    }
    // 找到 target，回傳索引 i
    i
}

/* 用二分搜尋找最右邊的 target */
fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    // 改為搜尋 target + 1 的最左插入位置
    let i = binary_search_insertion(nums, target + 1);
    // j 指向最右邊的 target，i 指向第一個大於 target 的元素
    let j = i - 1;
    // 找不到 target，回傳 -1
    if j == -1 || nums[j as usize] != target {
        return -1;
    }
    // 找到 target，回傳索引 j
    j
}

/* 主程式 */
fn main() {
    // 含有重複元素的陣列
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n陣列 nums = {:?}", nums);

    // 用二分搜尋找左界和右界
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("最左邊的元素 {} 的索引為 {}", target, index);
        let index = binary_search_right_edge(&nums, target);
        println!("最右邊的元素 {} 的索引為 {}", target, index);
    }
}

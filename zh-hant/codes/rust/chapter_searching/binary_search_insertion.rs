/*
 * File: binary_search_insertion.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */
#![allow(unused)]

/* 用二分搜尋找插入點（無重複元素） */
fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 將閉區間設為 [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // 計算中點索引 m
        if nums[m as usize] < target {
            i = m + 1; // target 若存在，必在區間 [m+1, j] 內
        } else if nums[m as usize] > target {
            j = m - 1; // target 若存在，必在區間 [i, m-1] 內
        } else {
            return m;
        }
    }
    // 找不到 target，回傳插入點 i
    i
}

/* 用二分搜尋找插入點（有重複元素） */
pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 將閉區間設為 [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2; // 計算中點索引 m
        if nums[m as usize] < target {
            i = m + 1; // target 若存在，必在區間 [m+1, j] 內
        } else if nums[m as usize] > target {
            j = m - 1; // target 若存在，必在區間 [i, m-1] 內
        } else {
            j = m - 1; // 最右邊小於 target 的元素位於區間 [i, m-1] 內
        }
    }
    // 回傳插入點 i
    i
}

/* 主程式 */
fn main() {
    // 不含重複元素的陣列
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    println!("\n陣列 nums = {:?}", nums);
    // 用二分搜尋找插入點
    for target in [6, 9] {
        let index = binary_search_insertion_simple(&nums, target);
        println!("元素 {} 的插入位置索引為 {}", target, index);
    }

    // 含有重複元素的陣列
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n陣列 nums = {:?}", nums);
    // 用二分搜尋找插入點
    for target in [2, 6, 20] {
        let index = binary_search_insertion(&nums, target);
        println!("元素 {} 的插入位置索引為 {}", target, index);
    }
}

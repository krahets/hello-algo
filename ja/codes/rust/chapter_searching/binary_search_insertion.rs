/*
 * File: binary_search_insertion.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */
#![allow(unused)]

/* 二分探索で挿入位置を探す（重複要素なし） */
fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 両閉区間 [0, n-1] を初期化
    while i <= j {
        let m = i + (j - i) / 2; // 中点インデックス m を計算
        if nums[m as usize] < target {
            i = m + 1; // target は区間 [m+1, j] にある
        } else if nums[m as usize] > target {
            j = m - 1; // target は区間 [i, m-1] にある
        } else {
            return m;
        }
    }
    // target が見つからなければ、挿入位置 i を返す
    i
}

/* 二分探索で挿入位置を探す（重複要素あり） */
pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 両閉区間 [0, n-1] を初期化
    while i <= j {
        let m = i + (j - i) / 2; // 中点インデックス m を計算
        if nums[m as usize] < target {
            i = m + 1; // target は区間 [m+1, j] にある
        } else if nums[m as usize] > target {
            j = m - 1; // target は区間 [i, m-1] にある
        } else {
            j = m - 1; // target より小さい最初の要素は区間 [i, m-1] にある
        }
    }
    // 挿入位置 i を返す
    i
}

/* Driver Code */
fn main() {
    // 重複要素のない配列
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    println!("\n配列 nums = {:?}", nums);
    // 二分探索で挿入位置を探す
    for target in [6, 9] {
        let index = binary_search_insertion_simple(&nums, target);
        println!("要素 {} の挿入位置のインデックスは {}", target, index);
    }

    // 重複要素を含む配列
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n配列 nums = {:?}", nums);
    // 二分探索で挿入位置を探す
    for target in [2, 6, 20] {
        let index = binary_search_insertion(&nums, target);
        println!("要素 {} の挿入位置のインデックスは {}", target, index);
    }
}

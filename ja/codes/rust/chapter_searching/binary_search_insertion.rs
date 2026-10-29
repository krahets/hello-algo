/*
 * File: binary_search_insertion.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */
#![allow(unused)]

/* 二分探索による挿入位置の探索（重複要素がない場合） */
fn binary_search_insertion_simple(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 閉区間 [0, n-1] を初期化する
    while i <= j {
        let m = i + (j - i) / 2; // 中央のインデックス m を計算する
        if nums[m as usize] < target {
            i = m + 1; // target は区間 [m+1, j] に存在する
        } else if nums[m as usize] > target {
            j = m - 1; // target は区間 [i, m-1] に存在する
        } else {
            return m;
        }
    }
    // target が見つからなかったので、挿入位置 i を返す
    i
}

/* 二分探索による挿入位置の探索（重複要素がある場合） */
pub fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 閉区間 [0, n-1] を初期化する
    while i <= j {
        let m = i + (j - i) / 2; // 中央のインデックス m を計算する
        if nums[m as usize] < target {
            i = m + 1; // target は区間 [m+1, j] に存在する
        } else if nums[m as usize] > target {
            j = m - 1; // target は区間 [i, m-1] に存在する
        } else {
            j = m - 1; // target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
        }
    }
    // 挿入位置 i を返す
    i
}

/* 実行用コード */
fn main() {
    // 重複要素のない配列
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
    println!("\n配列 nums = {:?}", nums);
    // 二分探索による挿入位置の探索
    for target in [6, 9] {
        let index = binary_search_insertion_simple(&nums, target);
        println!("要素 {} の挿入位置のインデックスは {}", target, index);
    }

    // 重複要素を含む配列
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n配列 nums = {:?}", nums);
    // 二分探索による挿入位置の探索
    for target in [2, 6, 20] {
        let index = binary_search_insertion(&nums, target);
        println!("要素 {} の挿入位置のインデックスは {}", target, index);
    }
}

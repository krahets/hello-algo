/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* 二分探索（閉区間） */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // 閉区間 [0, n-1] で初期化し、i は配列の先頭、j は末尾の要素を指す
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // 探索区間が空になるまで繰り返す（i > j のとき空）
    while i <= j {
        let m = i + (j - i) / 2; // 中央のインデックス m を求める
        if nums[m as usize] < target {
            // この場合、target の探索範囲は [m+1, j]
            i = m + 1;
        } else if nums[m as usize] > target {
            // この場合、target の探索範囲は [i, m-1]
            j = m - 1;
        } else {
            // 目標の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }
    // 目標の要素が見つからなかったので -1 を返す
    return -1;
}

/* 二分探索（左閉右開区間） */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // 左閉右開区間 [0, n) で初期化し、i は配列の先頭、j は末尾の一つ先を指す
    let mut i = 0;
    let mut j = nums.len() as i32;
    // 探索区間が空になるまで繰り返す（i = j のとき空）
    while i < j {
        let m = i + (j - i) / 2; // 中央のインデックス m を求める
        if nums[m as usize] < target {
            // この場合、target の探索範囲は [m+1, j)
            i = m + 1;
        } else if nums[m as usize] > target {
            // この場合、target の探索範囲は [i, m)
            j = m;
        } else {
            // 目標の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }
    // 目標の要素が見つからなかったので -1 を返す
    return -1;
}

/* 実行例 */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 二分探索（閉区間）
    let mut index = binary_search(&nums, target);
    println!("目標値 6 のインデックス = {index}");

    // 二分探索（左閉右開区間）
    index = binary_search_lcro(&nums, target);
    println!("目標値 6 のインデックス = {index}");
}

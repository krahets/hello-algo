/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* 二分探索（閉区間） */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // 閉区間 [0, n-1] を初期化する。i, j は配列の先頭要素と末尾要素をそれぞれ指す
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // 探索区間が空になるまで繰り返す（i > j のとき空になる）
    while i <= j {
        let m = i + (j - i) / 2; // 中央のインデックス m を計算する
        if nums[m as usize] < target {
            // この場合、target は区間 [m+1, j] に存在する
            i = m + 1;
        } else if nums[m as usize] > target {
            // この場合、target は区間 [i, m-1] に存在する
            j = m - 1;
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }
    // 目的の要素が見つからなかったので、-1 を返す
    return -1;
}

/* 二分探索（左閉右開区間） */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // 左閉右開区間 [0, n) を初期化する。i, j は配列の先頭要素と末尾要素の次をそれぞれ指す
    let mut i = 0;
    let mut j = nums.len() as i32;
    // 探索区間が空になるまで繰り返す（i = j のとき空になる）
    while i < j {
        let m = i + (j - i) / 2; // 中央のインデックス m を計算する
        if nums[m as usize] < target {
            // この場合、target は区間 [m+1, j) に存在する
            i = m + 1;
        } else if nums[m as usize] > target {
            // この場合、target は区間 [i, m) に存在する
            j = m;
        } else {
            // 目的の要素が見つかったので、そのインデックスを返す
            return m;
        }
    }
    // 目的の要素が見つからなかったので、-1 を返す
    return -1;
}

/* 実行用コード */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 二分探索（閉区間）
    let mut index = binary_search(&nums, target);
    println!("目的の要素 6 のインデックス = {index}");

    // 二分探索（左閉右開区間）
    index = binary_search_lcro(&nums, target);
    println!("目的の要素 6 のインデックス = {index}");
}

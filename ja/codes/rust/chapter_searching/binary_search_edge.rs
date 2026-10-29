/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

mod binary_search_insertion;

use binary_search_insertion::binary_search_insertion;

/* 二分探索で最も左にある target を探す */
fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    // target の挿入位置を探すことに等しい
    let i = binary_search_insertion(nums, target);
    // target が見つからなかったので、-1 を返す
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1;
    }
    // target が見つかったので、インデックス i を返す
    i
}

/* 二分探索で最も右にある target を探す */
fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    // 最も左にある target + 1 を探す問題に変換する
    let i = binary_search_insertion(nums, target + 1);
    // j は最も右にある target を指し、i は target より大きい最初の要素を指す
    let j = i - 1;
    // target が見つからなかったので、-1 を返す
    if j == -1 || nums[j as usize] != target {
        return -1;
    }
    // target が見つかったので、インデックス j を返す
    j
}

/* 実行用コード */
fn main() {
    // 重複要素を含む配列
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n配列 nums = {:?}", nums);

    // 二分探索で左境界と右境界を求める
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("最も左にある要素 {} のインデックスは {}", target, index);
        let index = binary_search_right_edge(&nums, target);
        println!("最も右にある要素 {} のインデックスは {}", target, index);
    }
}

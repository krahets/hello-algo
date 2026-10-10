/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

mod binary_search_insertion;

use binary_search_insertion::binary_search_insertion;

/* 最も左の target を二分探索 */
fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    // target の挿入位置を探すのと等価
    let i = binary_search_insertion(nums, target);
    // target が見つからなければ、-1 を返す
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1;
    }
    // target が見つかったら、インデックス i を返す
    i
}

/* 最も右の target を二分探索 */
fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    // 最左の target + 1 を探す問題に変換する
    let i = binary_search_insertion(nums, target + 1);
    // j は最も右の target を指し、i は target より大きい最初の要素を指す
    let j = i - 1;
    // target が見つからなければ、-1 を返す
    if j == -1 || nums[j as usize] != target {
        return -1;
    }
    // target が見つかったら、インデックス j を返す
    j
}

/* Driver Code */
fn main() {
    // 重複要素を含む配列
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n配列 nums = {:?}", nums);

    // 二分探索で左端と右端を探す
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("最も左にある要素 {} のインデックスは {}", target, index);
        let index = binary_search_right_edge(&nums, target);
        println!("最も右にある要素 {} のインデックスは {}", target, index);
    }
}

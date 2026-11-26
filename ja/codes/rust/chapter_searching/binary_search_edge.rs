/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

mod binary_search_insertion;

use binary_search_insertion::binary_search_insertion;

/* 最も左にある target の二分探索 */
fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    // target の挿入位置を探すことと同じ
    let i = binary_search_insertion(nums, target);
    // target が見つからなかったので -1 を返す
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1;
    }
    // target が見つかったのでインデックス i を返す
    i
}

/* 最も右にある target の二分探索 */
fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    // 最も左にある target + 1 の探索に置き換える
    let i = binary_search_insertion(nums, target + 1);
    // j は最も右の target を、i は target より大きい最初の要素を指す
    let j = i - 1;
    // target が見つからなかったので -1 を返す
    if j == -1 || nums[j as usize] != target {
        return -1;
    }
    // target が見つかったのでインデックス j を返す
    j
}

/* 実行例 */
fn main() {
    // 重複する要素がある配列
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n配列 nums = {:?}", nums);

    // 左端と右端の二分探索
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("最も左にある {} のインデックスは {}", target, index);
        let index = binary_search_right_edge(&nums, target);
        println!("最も右にある {} のインデックスは {}", target, index);
    }
}

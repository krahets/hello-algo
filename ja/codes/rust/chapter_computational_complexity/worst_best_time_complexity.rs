/*
 * File: worst_best_time_complexity.rs
 * Created Time: 2023-01-13
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::seq::SliceRandom;
use rand::thread_rng;

/* 要素が { 1, 2, ..., n } で、順序がシャッフルされた配列を生成 */
fn random_numbers(n: i32) -> Vec<i32> {
    // 配列 nums = { 1, 2, 3, ..., n } を生成
    let mut nums = (1..=n).collect::<Vec<i32>>();
    // 配列要素をランダムにシャッフル
    nums.shuffle(&mut thread_rng());
    nums
}

/* 配列 nums 内で数値 1 のインデックスを探す */
fn find_one(nums: &[i32]) -> Option<usize> {
    for i in 0..nums.len() {
        // 要素 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
        // 要素 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
        if nums[i] == 1 {
            return Some(i);
        }
    }
    None
}

/* Driver Code */
fn main() {
    for _ in 0..10 {
        let n = 100;
        let nums = random_numbers(n);
        let index = find_one(&nums).unwrap();
        print!("\n配列 [ 1, 2, ..., n ] をシャッフルした後 = ");
        print_util::print_array(&nums);
        println!("\n数字 1 のインデックスは {}", index);
    }
}

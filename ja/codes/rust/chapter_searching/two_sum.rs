/*
 * File: two_sum.rs
 * Created Time: 2023-01-14
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::HashMap;

/* 方法 1：総当たり列挙 */
pub fn two_sum_brute_force(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
    let size = nums.len();
    // 二重ループのため、時間計算量は O(n^2)
    for i in 0..size - 1 {
        for j in i + 1..size {
            if nums[i] + nums[j] == target {
                return Some(vec![i as i32, j as i32]);
            }
        }
    }
    None
}

/* 方法 2：補助ハッシュテーブル */
pub fn two_sum_hash_table(nums: &Vec<i32>, target: i32) -> Option<Vec<i32>> {
    // 補助ハッシュテーブルの空間計算量は O(n)
    let mut dic = HashMap::new();
    // 一重ループのため、時間計算量は O(n)
    for (i, num) in nums.iter().enumerate() {
        match dic.get(&(target - num)) {
            Some(v) => return Some(vec![*v as i32, i as i32]),
            None => dic.insert(num, i as i32),
        };
    }
    None
}

fn main() {
    // ======= テストケース =======
    let nums = vec![2, 7, 11, 15];
    let target = 13;

    // ====== 実行用コード ======
    // 方法 1
    let res = two_sum_brute_force(&nums, target).unwrap();
    print!("方法 1 res = ");
    print_util::print_array(&res);
    // 方法 2
    let res = two_sum_hash_table(&nums, target).unwrap();
    print!("\n方法 2 res = ");
    print_util::print_array(&res);
}

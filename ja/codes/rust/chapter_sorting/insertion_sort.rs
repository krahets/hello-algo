/*
 * File: insertion_sort.rs
 * Created Time: 2023-02-13
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

/* 挿入ソート */
fn insertion_sort(nums: &mut [i32]) {
    // 外側のループ：ソート済み区間は [0, i-1]
    for i in 1..nums.len() {
        let (base, mut j) = (nums[i], (i - 1) as i32);
        // 内側のループ：ソート済み区間 [0, i-1] の正しい位置に base を挿入する
        while j >= 0 && nums[j as usize] > base {
            nums[(j + 1) as usize] = nums[j as usize]; // nums[j] を右に 1 つずらす
            j -= 1;
        }
        nums[(j + 1) as usize] = base; // 正しい位置に base を代入する
    }
}

/* 実行用コード */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    insertion_sort(&mut nums);
    print!("挿入ソート完了後 nums = ");
    print_util::print_array(&nums);
}

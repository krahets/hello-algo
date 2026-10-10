/*
 * File: selection_sort.rs
 * Created Time: 2023-05-30
 * Author: WSL0809 (wslzzy@outlook.com)
 */

use hello_algo_rust::include::print_util;

/* 選択ソート */
fn selection_sort(nums: &mut [i32]) {
    if nums.is_empty() {
        return;
    }
    let n = nums.len();
    // 外側ループ：未整列区間は [i, n-1]
    for i in 0..n - 1 {
        // 内側のループ：未ソート区間の最小要素を見つける
        let mut k = i;
        for j in i + 1..n {
            if nums[j] < nums[k] {
                k = j; // 最小要素のインデックスを記録
            }
        }
        // その最小要素を未整列区間の先頭要素と交換する
        nums.swap(i, k);
    }
}

/* Driver Code */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    selection_sort(&mut nums);
    print!("\n選択ソート完了後 nums = ");
    print_util::print_array(&nums);
}

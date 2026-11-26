/*
 * File: bubble_sort.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* バブルソート */
fn bubble_sort(nums: &mut [i32]) {
    // 外側のループ：未整列区間は [0, i]
    for i in (1..nums.len()).rev() {
        // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // nums[j] と nums[j + 1] を交換
                nums.swap(j, j + 1);
            }
        }
    }
}

/* バブルソート（フラグによる最適化） */
fn bubble_sort_with_flag(nums: &mut [i32]) {
    // 外側のループ：未整列区間は [0, i]
    for i in (1..nums.len()).rev() {
        let mut flag = false; // フラグを初期化
        // 内側のループ：交換を繰り返し、未整列区間 [0, i] の最大要素を右端に移す
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // nums[j] と nums[j + 1] を交換
                nums.swap(j, j + 1);
                flag = true; // 交換があったことを記録
            }
        }
        if !flag {
            break; // この走査で交換がなければループを終了
        };
    }
}

/* 実行例 */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    bubble_sort(&mut nums);
    print!("バブルソート後の nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [4, 1, 3, 1, 5, 2];
    bubble_sort_with_flag(&mut nums1);
    print!("\nバブルソート後の nums1 = ");
    print_util::print_array(&nums1);
}

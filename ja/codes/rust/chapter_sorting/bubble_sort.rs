/*
 * File: bubble_sort.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* バブルソート */
fn bubble_sort(nums: &mut [i32]) {
    // 外側のループ：未ソート区間は [0, i]
    for i in (1..nums.len()).rev() {
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // nums[j] と nums[j + 1] を交換
                nums.swap(j, j + 1);
            }
        }
    }
}

/* バブルソート（フラグ最適化） */
fn bubble_sort_with_flag(nums: &mut [i32]) {
    // 外側のループ：未ソート区間は [0, i]
    for i in (1..nums.len()).rev() {
        let mut flag = false; // フラグを初期化する
        // 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // nums[j] と nums[j + 1] を交換
                nums.swap(j, j + 1);
                flag = true; // 交換する要素を記録
            }
        }
        if !flag {
            break; // このバブル処理で要素交換が一度もなければそのまま終了
        };
    }
}

/* Driver Code */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    bubble_sort(&mut nums);
    print!("バブルソート完了後 nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [4, 1, 3, 1, 5, 2];
    bubble_sort_with_flag(&mut nums1);
    print!("\nバブルソート完了後 nums1 = ");
    print_util::print_array(&nums1);
}

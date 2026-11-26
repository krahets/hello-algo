/*
 * File: selection_sort.rs
 * Created Time: 2023-05-30
 * Author: WSL0809 (wslzzy@outlook.com)
 */

use hello_algo_rust::include::print_util;

/* 選擇排序 */
fn selection_sort(nums: &mut [i32]) {
    if nums.is_empty() {
        return;
    }
    let n = nums.len();
    // 外層迴圈：未排序區間為 [i, n-1]
    for i in 0..n - 1 {
        // 內層迴圈：找出未排序區間中的最小元素
        let mut k = i;
        for j in i + 1..n {
            if nums[j] < nums[k] {
                k = j; // 記錄最小元素的索引
            }
        }
        // 將最小元素與未排序區間的第一個元素交換
        nums.swap(i, k);
    }
}

/* 主程式 */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    selection_sort(&mut nums);
    print!("\n選擇排序完成後 nums = ");
    print_util::print_array(&nums);
}

/*
 * File: insertion_sort.rs
 * Created Time: 2023-02-13
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

/* 插入排序 */
fn insertion_sort(nums: &mut [i32]) {
    // 外循环：已排序区间为 [0, i-1]
    for i in 1..nums.len() {
        let (base, mut j) = (nums[i], (i - 1) as i32);
        // 内循环：将 base 插入到已排序区间 [0, i-1] 中的正确位置
        while j >= 0 && nums[j as usize] > base {
            nums[(j + 1) as usize] = nums[j as usize]; // 将 nums[j] 向右移动一位
            j -= 1;
        }
        nums[(j + 1) as usize] = base; // 将 base 赋值到正确位置
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    insertion_sort(&mut nums);
    print!("插入排序完成后 nums = ");
    print_util::print_array(&nums);
}

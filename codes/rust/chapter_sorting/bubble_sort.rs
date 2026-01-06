/*
 * File: bubble_sort.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 冒泡排序 */
fn bubble_sort(nums: &mut [i32]) {
    // 外循环：未排序区间为 [0, i]
    for i in (1..nums.len()).rev() {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                nums.swap(j, j + 1);
            }
        }
    }
}

/* 冒泡排序（标志优化） */
fn bubble_sort_with_flag(nums: &mut [i32]) {
    // 外循环：未排序区间为 [0, i]
    for i in (1..nums.len()).rev() {
        let mut flag = false; // 初始化标志位
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                nums.swap(j, j + 1);
                flag = true; // 记录交换元素
            }
        }
        if !flag {
            break; // 此轮“冒泡”未交换任何元素，直接跳出
        };
    }
}

/* Driver Code */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    bubble_sort(&mut nums);
    print!("冒泡排序完成后 nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [4, 1, 3, 1, 5, 2];
    bubble_sort_with_flag(&mut nums1);
    print!("\n冒泡排序完成后 nums1 = ");
    print_util::print_array(&nums1);
}

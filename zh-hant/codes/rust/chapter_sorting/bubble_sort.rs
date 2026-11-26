/*
 * File: bubble_sort.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 氣泡排序 */
fn bubble_sort(nums: &mut [i32]) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for i in (1..nums.len()).rev() {
        // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // 交換 nums[j] 與 nums[j + 1]
                nums.swap(j, j + 1);
            }
        }
    }
}

/* 氣泡排序（以旗標最佳化） */
fn bubble_sort_with_flag(nums: &mut [i32]) {
    // 外層迴圈：尚未排序的區間為 [0, i]
    for i in (1..nums.len()).rev() {
        let mut flag = false; // 初始化旗標
        // 內層迴圈：逐次交換，將未排序區間 [0, i] 中的最大元素移到區間最右端
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // 交換 nums[j] 與 nums[j + 1]
                nums.swap(j, j + 1);
                flag = true; // 記錄本輪曾交換元素
            }
        }
        if !flag {
            break; // 這一輪「冒泡」未交換任何元素，直接跳出迴圈
        };
    }
}

/* 主程式 */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    bubble_sort(&mut nums);
    print!("氣泡排序完成後 nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [4, 1, 3, 1, 5, 2];
    bubble_sort_with_flag(&mut nums1);
    print!("\n氣泡排序完成後 nums1 = ");
    print_util::print_array(&nums1);
}

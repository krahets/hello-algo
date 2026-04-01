/*
 * File: bubble_sort.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* 冒泡排序 */
pub fn bubble_sort(nums: &mut [i32]) {
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
pub fn bubble_sort_with_flag(nums: &mut [i32]) {
    // 外循环：未排序区间为 [0, i]
    for i in (1..nums.len()).rev() {
        // 初始化标志位
        let mut flag = false;
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                nums.swap(j, j + 1);
                // 记录交换元素
                flag = true;
            }
        }
        if !flag {
            // 此轮“冒泡”未交换任何元素，直接跳出
            break;
        }
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    bubble_sort(&mut nums);
    println!("冒泡排序完成后 nums = {nums:?}");

    let mut nums = [4, 1, 3, 1, 5, 2];
    bubble_sort_with_flag(&mut nums);
    println!("冒泡排序完成后 nums = {nums:?}");
}

/*
 * File: insertion_sort.rs
 * Created Time: 2023-02-13
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

include!("../include/include.rs");

/* 插入排序 */
fn insertion_sort(nums: &mut [i32]) {
    // 外迴圈：已排序區間為 [0, i-1]
    for i in 1..nums.len() {
        let (base, mut j) = (nums[i], (i - 1) as i32);
        // 內迴圈：將 base 插入到已排序區間 [0, i-1] 中的正確位置
        while j >= 0 && nums[j as usize] > base {
            nums[(j + 1) as usize] = nums[j as usize]; // 將 nums[j] 向右移動一位
            j -= 1;
        }
        nums[(j + 1) as usize] = base; // 將 base 賦值到正確位置
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    insertion_sort(&mut nums);
    print!("插入排序完成後 nums = ");
    print_util::print_array(&nums);
}

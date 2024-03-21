/*
 * File: selection_sort.rs
 * Created Time: 2023-05-30
 * Author: WSL0809 (wslzzy@outlook.com)
 */

include!("../include/include.rs");

/* 选择排序 */
fn selection_sort(nums: &mut [i32]) {
    if nums.is_empty() {
        return;
    }
    let n = nums.len();
    // 外循环：未排序区间为 [i, n-1]
    for i in 0..n - 1 {
        // 内循环：找到未排序区间内的最小元素
        let mut k = i;
        for j in i + 1..n {
            if nums[j] < nums[k] {
                k = j; // 记录最小元素的索引
            }
        }
        // 将该最小元素与未排序区间的首个元素交换
        nums.swap(i, k);
    }
}

/* Driver Code */
pub fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    selection_sort(&mut nums);
    print!("\n选择排序完成后 nums = ");
    print_util::print_array(&nums);
}

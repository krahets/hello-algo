/*
 * File: insertion_sort.rs
 * Created Time: 2023-02-13
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* 插入排序 */
pub fn insertion_sort(nums: &mut [i32]) {
    // 外循环：已排序区间为 [0, i-1]
    for i in 1..nums.len() {
        let base = nums[i];
        let mut j = i - 1;
        // 内循环：将 base 插入到已排序区间 [0, i - 1] 中的正确位置
        while nums[j] > base {
            // 将 nums[j] 向右移动一位
            nums[j + 1] = nums[j];
            j = j.wrapping_sub(1);
            // j 越界回绕，此时 [0, i - 1] 已全部左移，
            // 索引 0 处逻辑上留空，可以直接插入 base
            if j == usize::MAX {
                break;
            }
        }
        // 将 base 赋值到正确位置
        nums[j.wrapping_add(1)] = base;
    }
}

/* Driver Code */
fn main() {
    let mut nums = [4, 1, 3, 1, 5, 2];
    insertion_sort(&mut nums);
    println!("插入排序完成后 nums = {nums:?}");
}

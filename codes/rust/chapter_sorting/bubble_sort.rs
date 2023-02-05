/**
 * File: bubble_sort.rs
 * Created Time: 2023-02-05
 * Author: sjinzh (sjinzh@gmail.com)
*/

/* 冒泡排序 */
fn bubble_sort(nums: &mut [i32]) {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for i in (1..nums.len()).rev() {
        // 内循环：冒泡操作
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
            }
        }
    }
}

/* 冒泡排序（标志优化） */
fn bubble_sort_with_flag(nums: &mut [i32]) {
    // 外循环：待排序元素数量为 n-1, n-2, ..., 1
    for i in (1..nums.len()).rev() {
        let mut flag = false;   // 初始化标志位
        // 内循环：冒泡操作
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                flag = true;        // 记录交换元素
            }
        }
        if !flag {break};           // 此轮冒泡未交换任何元素，直接跳出
    }
}

/* Driver Code */
pub fn main() {
    let mut nums = [ 4, 1, 3, 1, 5, 2 ];
    bubble_sort(&mut nums);
    print!("冒泡排序完成后 nums = ");
    inc::print_util::print_array(&nums);

    let mut nums1 = [ 4, 1, 3, 1, 5, 2 ];
    bubble_sort_with_flag(&mut nums1);
    print!("\n冒泡排序完成后 nums1 = ");
    inc::print_util::print_array(&nums1);
}
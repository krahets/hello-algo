/*
 * File: counting_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 计数排序 */
// 简单实现，无法用于排序对象
fn counting_sort_naive(nums: &mut [i32]) {
    // 1. 统计数组最大元素 m
    let m = *nums.iter().max().unwrap();
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    let mut counter = vec![0; m as usize + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. 遍历 counter ，将各元素填入原数组 nums
    let mut i = 0;
    for num in 0..m + 1 {
        for _ in 0..counter[num as usize] {
            nums[i] = num;
            i += 1;
        }
    }
}

/* 计数排序 */
// 完整实现，可排序对象，并且是稳定排序
fn counting_sort(nums: &mut [i32]) {
    // 1. 统计数组最大元素 m
    let m = *nums.iter().max().unwrap() as usize;
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    let mut counter = vec![0; m + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
    // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
    for i in 0..m {
        counter[i + 1] += counter[i];
    }
    // 4. 倒序遍历 nums ，将各元素填入结果数组 res
    // 初始化数组 res 用于记录结果
    let n = nums.len();
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let num = nums[i];
        res[counter[num as usize] - 1] = num; // 将 num 放置到对应索引处
        counter[num as usize] -= 1; // 令前缀和自减 1 ，得到下次放置 num 的索引
    }
    // 使用结果数组 res 覆盖原数组 nums
    nums.copy_from_slice(&res)
}

/* Driver Code */
fn main() {
    let mut nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort_naive(&mut nums);
    print!("计数排序（无法排序对象）完成后 nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort(&mut nums1);
    print!("\n计数排序完成后 nums1 = ");
    print_util::print_array(&nums1);
}

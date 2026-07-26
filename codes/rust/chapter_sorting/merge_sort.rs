/*
 * File: merge_sort.rs
 * Created Time: 2023-02-14
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* 合并左子数组和右子数组 */
fn merge(nums: &mut [i32]) {
    // 计算右子数组区间的起始索引
    // 注意：目前 nums.len() >= 1 由 merge_sort 保证;
    // 作为一个独立的函数，此处应当增加对空数组的处理以提升健壮性，
    // 否则应该内联到 merge_sort 中
    let mid = (nums.len() - 1) / 2;
    let right_start = mid + 1;
    // 左子数组区间为 [0, mid], 右子数组区间为 [mid + 1, nums.len() - 1]
    // 创建一个临时数组 tmp，用于存放合并后的结果
    let mut tmp = Vec::with_capacity(nums.len());
    // 初始化左子数组和右子数组的起始索引
    let mut i = 0;
    let mut j = right_start;
    // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
    while i < right_start && j < nums.len() {
        if nums[i] <= nums[j] {
            tmp.push(nums[i]);
            i += 1;
        } else {
            tmp.push(nums[j]);
            j += 1;
        }
    }
    // 将左子数组和右子数组的剩余元素复制到临时数组中
    while i < right_start {
        tmp.push(nums[i]);
        i += 1;
    }
    while j < nums.len() {
        tmp.push(nums[j]);
        j += 1;
    }
    // 将临时数组 tmp 中的元素复制回当前子数组
    nums.copy_from_slice(&tmp);
}

/* 归并排序 */
pub fn merge_sort(nums: &mut [i32]) {
    // 当子数组长度小于等于 1 时终止递归
    if nums.len() <= 1 {
        return;
    }

    // 划分阶段
    // 计算中点
    let mid = (nums.len() - 1) / 2;

    // 相比直接传递原数组的切片和左右索引，这里传入子数组切片更安全，
    // 因为它不会因为调用者传入错误索引而越界 panic

    // 递归左子数组
    merge_sort(&mut nums[0..=mid]);
    // 递归右子数组
    merge_sort(&mut nums[(mid + 1)..]);

    // 合并阶段
    merge(nums);
}

/* Driver Code */
fn main() {
    /* 归并排序 */
    let mut nums = [7, 3, 2, 6, 0, 1, 5, 4];
    merge_sort(&mut nums);
    println!("归并排序完成后 nums = {nums:?}");
}

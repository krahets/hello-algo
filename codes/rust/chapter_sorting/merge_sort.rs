/**
 * File: merge_sort.rs
 * Created Time: 2023-02-14
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* 合并左子数组和右子数组 */
fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
    // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
    // 创建一个临时数组 tmp ，用于存放合并后的结果
    let tmp_size = right - left + 1;
    let mut tmp = vec![0; tmp_size];
    // 初始化左子数组和右子数组的起始索引
    let (mut i, mut j, mut k) = (left, mid + 1, 0);
    // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
    while i <= mid && j <= right {
        if nums[i] <= nums[j] {
            tmp[k] = nums[i];
            i += 1;
        } else {
            tmp[k] = nums[j];
            j += 1;
        }
        k += 1;
    }
    // 将左子数组和右子数组的剩余元素复制到临时数组中
    while i <= mid {
        tmp[k] = nums[i];
        k += 1;
        i += 1;
    }
    while j <= right {
        tmp[k] = nums[j];
        k += 1;
        j += 1;
    }
    // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
    for k in 0..tmp_size {
        nums[left + k] = tmp[k];
    }
}

/* 归并排序 */
fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
    // 终止条件
    if left >= right {
        return; // 当子数组长度为 1 时终止递归
    }

    // 划分阶段
    let mid = (left + right) / 2; // 计算中点
    merge_sort(nums, left, mid); // 递归左子数组
    merge_sort(nums, mid + 1, right); // 递归右子数组

    // 合并阶段
    merge(nums, left, mid, right);
}

/* Driver Code */
fn main() {
    /* 归并排序 */
    let mut nums = [7, 3, 2, 6, 0, 1, 5, 4];
    let right = nums.len() - 1;
    merge_sort(&mut nums, 0, right);
    println!("归并排序完成后 nums = {:?}", nums);
}

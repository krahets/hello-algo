/**
 * File: merge_sort.rs
 * Created Time: 2023-02-14
 * Author: xBLACKICEx (xBLACKICEx@outlook.com)
 */

/* 合并左子数组和右子数组 */
// 左子数组区间 [left, mid]
// 右子数组区间 [mid + 1, right]
fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
    // 初始化辅助数组
    let tmp: Vec<i32> = nums[left..right + 1].to_vec();
    // 左子数组的起始索引和结束索引
    let (left_start, left_end) = (left - left, mid - left);
    // 右子数组的起始索引和结束索引
    let (right_start, right_end) = (mid + 1 - left, right-left);
    // i, j 分别指向左子数组、右子数组的首元素
    let (mut l_corrent, mut r_corrent) = (left_start, right_start);
    // 通过覆盖原数组 nums 来合并左子数组和右子数组
    for k in left..right + 1 {
        // 若“左子数组已全部合并完”，则选取右子数组元素，并且 j++
        if l_corrent > left_end {
            nums[k] = tmp[r_corrent];
            r_corrent += 1;
        }
        // 否则，若“右子数组已全部合并完”或“左子数组元素 <= 右子数组元素”，则选取左子数组元素，并且 i++
        else if r_corrent > right_end || tmp[l_corrent] <= tmp[r_corrent] {
            nums[k] = tmp[l_corrent];
            l_corrent += 1;
        }
        // 否则，若“左右子数组都未全部合并完”且“左子数组元素 > 右子数组元素”，则选取右子数组元素，并且 j++
        else {
            nums[k] = tmp[r_corrent];
            r_corrent += 1;
        }
    }
}

/* 归并排序 */
fn merge_sort(left: usize, right: usize, nums: &mut [i32]) {
    // 终止条件
    if left >= right { return; }       // 当子数组长度为 1 时终止递归
    // 划分阶段
    let mid = (left + right) / 2;     // 计算中点
    merge_sort(left, mid, nums);      // 递归左子数组
    merge_sort(mid + 1, right, nums);  // 递归右子数组
    // 合并阶段
    merge(nums, left, mid, right);
}

/* Driver Code */
fn main() {
    /* 归并排序 */
    let mut nums = [7, 3, 2, 6, 0, 1, 5, 4];
    merge_sort(0, nums.len() - 1, &mut nums);
    println!("归并排序完成后 nums = {:?}", nums);
}